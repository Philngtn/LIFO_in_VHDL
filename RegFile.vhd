-- ************************************************************************
-- Author: Phuc Nguyen
-- Email: philngtn@gmail.com
-- File : RegFile.vhd
-- Design Units:
-- ************************************************************************


library ieee;
use ieee.std_logic_1164.all;

entity RegFile is
  port(
      
      clk,reset :in  std_logic;
      wr_en     :in  std_logic;
      w_addr    :in  std_logic_vector(1 downto 0);
      w_data    :in  std_logic_vector(15 downto 0);
      r_addr    :in  std_logic_vector(1 downto 0);
      r_data    :out std_logic_vector(15 downto 0)
      
      );
end entity;

architecture behavioral of RegFile is
  
  constant W: natural := 2;  -- number of bits address 
  constant B: natural := 16; -- number of bits in data
  
  type reg_file_type is array (2**W-1 downto 0) of -- 2D array
       std_logic_vector(B-1 downto 0);
       
  signal  array_reg: reg_file_type;
  signal  array_next: reg_file_type;
  
  signal  en : std_logic_vector(2**W-1 downto 0);
  
  begin
    
    -- Register 
    process(clk, reset)
    begin
      
      -- Positive reset = 1
      
      if (reset = '1') then 
          array_reg(3) <= (others => 'U');
          array_reg(2) <= (others => 'U');
          array_reg(1) <= (others => 'U');
          array_reg(0) <= (others => 'U');
      elsif( clk'event and clk = '1' ) then
          array_reg(3) <= array_next(3);
          array_reg(2) <= array_next(2);
          array_reg(1) <= array_next(1);
          array_reg(0) <= array_next(0);
      end if;              
    end process; 
    
    -- Enable logic for register
    process(array_reg, en, w_data)
      begin
        
        array_next(3) <= array_reg(3);
        array_next(2) <= array_reg(2);
        array_next(1) <= array_reg(1);
        array_next(0) <= array_reg(0);
        
        if en(3) = '1' then
           array_next(3) <= w_data;
        end if;
        
        if en(2) = '1' then
           array_next(2) <= w_data;
        end if;
        
        if en(1) = '1' then
           array_next(1) <= w_data;
        end if;
        
        if en(0) = '1' then
           array_next(0) <= w_data;
        end if;
        
    end process;
    
    -- Decoding for write address
    
    process(wr_en, w_addr)
    begin 
      if (wr_en = '0') then
          en <= (others => '0');
      else
          case w_addr is
             when "11" => en <= "1000";
             when "01" => en <= "0010";
             when "10" => en <= "0100";
             when others => en <= "0001";
          end case;
      end if;
      
    end process;
    
    -- Read data
    process(r_addr)
      begin
      case r_addr is 
      when "00" => 
        r_data <= array_reg(0);
        
      when "01" => 
        r_data <= array_reg(1);
        
      when "10" => 
        r_data <= array_reg(2);
        
      when others => 
        r_data <= array_reg(3);
      
      end case;
    end process;
    
                   
end architecture;
      
      
      
      
          
        
        
        
                  
      
      
      
      
      
      
      
      
      
      