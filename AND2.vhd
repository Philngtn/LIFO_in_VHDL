-- ************************************************************************
-- Author: Phuc Nguyen
-- File : AND2.vhd
-- Design Units:
--    entity AND2  
--          function: AND 2 inputs
--          input: a,b
--          output: c = a and b
-- ************************************************************************

library ieee;
use ieee.std_logic_1164.all;

entity AND2 is 
  port ( A, B  : in  std_logic;
         C     : out std_logic);
end entity;

architecture behavior of AND2 is
begin 
  C <= A and B;
end architecture;

