-- ************************************************************************
-- Author: Phuc Nguyen
-- Email: philngtn@gmail.com
-- File : FILO_Buffer.vhd
-- Design Units:
-- ************************************************************************

library ieee;
use ieee.std_logic_1164.all;

entity FILO_Buffer is
  port ( w_data : in std_logic_vector(15 downto 0);
         push_pop, clk, reset : in std_logic;
         r_data : out std_logic_vector(15 downto 0);
         full, empty : out std_logic;
         stk_ptr: out integer
       );
end entity;

-- RST = 1 reset 
architecture behaviour of FILO_Buffer is
  
  component FILO_Controller is
    port ( clk, reset, push_pop : in std_logic;
           full_o, empty_o   : out std_logic;
           w_addr, r_addr: out std_logic_vector(1 downto 0);
           stack_ptr : out integer
           
         );
  end component;
  
  component RegFile is
    port(
        clk,reset :in  std_logic;
        wr_en     :in  std_logic;
        w_addr    :in  std_logic_vector(1 downto 0);
        w_data    :in  std_logic_vector(15 downto 0);
        r_addr    :in  std_logic_vector(1 downto 0);
        r_data    :out std_logic_vector(15 downto 0)      
        );
  end component;
  
  component INV1 is
    port ( A     : in  std_logic;
           C     : out std_logic);
  end component;
  
  component AND2 is
    port ( A, B  : in  std_logic;
           C     : out std_logic);
  end component;
  
  signal full_cmd, notFull,empty_cmd, wr_en_cmd: std_logic;
  signal w_addr_cmd, r_addr_cmd : std_logic_vector(1 downto 0);
  
  
  begin
    
    U1: INV1 port map(A => full_cmd, C => notFull);
    
    U2: AND2 port map(A => notFull, B => push_pop, C=> wr_en_cmd);
    
    U3: FILO_Controller port map(clk => clk, reset => reset,
                                 push_pop=> push_pop,  stack_ptr=>stk_ptr,
                                 full_o=> full_cmd, empty_o => empty, 
                                 w_addr => w_addr_cmd, r_addr => r_addr_cmd);
                                 
    
    U4: RegFile port map(clk => clk, reset => reset, wr_en => wr_en_cmd,
                         w_addr => w_addr_cmd,
                         w_data => w_data,
                         r_addr => r_addr_cmd,
                         r_data => r_data
                       );
                  
    full<= full_cmd;
    
    
end architecture; 
  
  
  
  