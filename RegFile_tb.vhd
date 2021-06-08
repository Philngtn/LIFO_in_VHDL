
-- ************************************************************************
-- Author: Phuc Nguyen
-- Email: philngtn@gmail.com
-- File : RegFile_tb.vhd
-- Design Units:
-- ************************************************************************

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity RegFile_tb is
end entity;

architecture testBench of RegFile_tb is
  
  component RegFile 
  port(
      clk,reset :in  std_logic;
      wr_en     :in  std_logic;
      w_addr    :in  std_logic_vector(1 downto 0);
      w_data    :in  std_logic_vector(15 downto 0);
      r_addr    :in  std_logic_vector(1 downto 0);
      r_data    :out std_logic_vector(15 downto 0)
      );
  end component;
   
  signal  clk :  std_logic;
  signal reset : std_logic := '1'; 
  signal  wr_en     :  std_logic;
  signal  w_addr    :  std_logic_vector(1 downto 0);
  signal  w_data    :  std_logic_vector(15 downto 0);
  signal  r_addr    :  std_logic_vector(1 downto 0) := "00" ;
  signal  r_data    :  std_logic_vector(15 downto 0);
  
  constant clk_period : time := 10 ns;
  
  begin
    
    U1: RegFile port map(clk=>clk, reset => reset, 
                         wr_en => wr_en, w_addr => w_addr,
                         w_data => w_data, r_addr => r_addr,
                         r_data => r_data);
                         
    clk_process : process                     
    begin 
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
    end process;   
    
    stim: process
    begin
    
      reset <= '0';
      wr_en <= '0';
      wait for 5 ns;
      
    
      wr_en <= '1';
      w_addr <= "00";
      w_data <= std_logic_vector(to_unsigned(36, w_data'length));
      wait for 10 ns;
      
      wr_en <= '1';
      w_addr <= "10";
      w_data <= std_logic_vector(to_unsigned(212, w_data'length));
      wait for 10 ns;
                        
      wr_en <= '1';
      w_addr <= "11";
      w_data <= std_logic_vector(to_unsigned(56, w_data'length));
      wait for 10 ns;
      
      wr_en <= '0';
      w_addr <= "00";
      w_data <= std_logic_vector(to_unsigned(146, w_data'length));
      wait for 10 ns;
      
      wr_en <= '1';
      r_addr <= "00";
      wait for 10 ns;
      
      wr_en <= '1';
      r_addr <= "10";
      wait for 10 ns;
      
      wr_en <= '1';
      r_addr <= "11";
      wait for 10 ns;
      
      reset <= '1';
      wr_en <= '1';
      r_addr <= "01";
      wait for 10 ns;
      
      
      r_addr <= "00";
      wait for 10 ns;
      
      r_addr <= "11";
      wait for 10 ns;
      
      r_addr <= "00";
      wait for 10 ns;
      
      
      r_addr <= "10";
      wait;
      
  end process;
      
end architecture;

      
      