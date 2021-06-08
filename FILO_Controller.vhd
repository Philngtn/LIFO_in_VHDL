-- ************************************************************************
-- Author: Phuc Nguyen
-- Email: philngtn@gmail.com
-- File : FILO_Controller.vhd
-- Design Units:
-- ************************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity FILO_Controller is
  generic(n : natural := 4);
  port ( clk, reset, push_pop : in std_logic; -- 1 is push, 0 is pop
         full_o, empty_o   : out std_logic;
         w_addr, r_addr: out std_logic_vector(1 downto 0);
         stack_ptr :out integer
       );
end entity;


architecture behavior of FILO_Controller is 
  
  begin
    
     process(clk,reset)
       
      variable last: integer range -1 to n := 0;
       
      begin
        
        stack_ptr <= last;
        
        if (reset = '1') then
            last := -1;
            full_o <= '0';
            empty_o <= '1';
            r_addr <= std_logic_vector(to_unsigned(last + 1 ,w_addr'length));
            w_addr <= std_logic_vector(to_unsigned(last + 1 ,w_addr'length));
                        

        elsif rising_edge(clk) and push_pop = '1' then
          if (last = n) then null;
          else
            if (last = n-1) then full_o <= '1'; end if;
            if (last = -1) then empty_o <= '0'; end if;
              w_addr <= std_logic_vector(to_unsigned(last + 1 ,w_addr'length));
      
              last := last + 1;
              
            end if;
        elsif rising_edge(clk) and push_pop = '0' then
          if(last = -1) then null;
          else
            if(last = n) then last:= last -1; end if;
            
            r_addr <= std_logic_vector(to_unsigned(last ,w_addr'length));
            last := last -1;
            full_o <= '0';
            if (last = -1) then empty_o <= '1'; end if;
          end if;
        end if;
          

    end process;
    
end architecture;
    
       
    
    
    
    
    