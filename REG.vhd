-- REGISTER 1-Bit 


library ieee;
use ieee.std_logic_1164.all;


entity REG is
  port( load, input, clk, reset : in std_logic;
        q, q_bar : out std_logic);
end entity; 

-- LOAD = 0 => get input
-- RESET = 1 => DFF works

architecture structural of REG is
  
  component DFF is
     port ( d, clk, reset: in std_logic;
            q, q_bar : out std_logic);
  end component;
  
  component AND2 is
    port ( A, B  : in  std_logic;
           C     : out std_logic);
  end component;
  
  component OR2 is
    port ( A, B  : in  std_logic;
           C     : out std_logic);
  end component;
  
  component INV1 is
    port ( A     : in  std_logic;
           C     : out std_logic);
  end component;
  
  signal notLoad, outAnd1 , outAnd2 , outOr , outDFF, outDFF_bar: std_logic;
  
  begin 
    
    U1: INV1 port map( A => load, C => notLoad);
    U2: AND2 port map( A => outDFF, B => load, C => outAnd1);    -- fix load 1 -> 0 to load data
    U3: AND2 port map( A => input, B => notLoad, C => outAnd2);
    
      --  U2: AND2 port map( A => outDFF, B => notLoad, C => outAnd1); -- load 0 -> 1 to load data
      --  U3: AND2 port map( A => input, B => load, C => outAnd2);  
      
    U4: OR2  port map( A => outAnd1, B => outAnd2, C => outOr);
      
    U5: DFF port map(d => outOr, clk => clk, reset => reset, q => outDFF, q_bar => outDFF_bar);
      
    q <= outDFF;
    q_bar <= outDFF_bar;
    
  end architecture;