
-- ************************************************************************
-- Author: Phuc Nguyen
-- File : INV1.vhd
-- Design Units:
--    entity INV1  
--          function: INV 1 inputs
--          input: a
--          output: not a
--    architecture INV1_arch:
--          truth_table based sum_of_products
--
-- ************************************************************************

library ieee;
use ieee.std_logic_1164.all;

entity INV1 is 
  port ( A     : in  std_logic;
         C     : out std_logic);
end entity;

architecture behavior of INV1 is
begin 
  C <= not A ;
end architecture;
