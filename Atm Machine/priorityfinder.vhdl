library work;
use work.Gates.all;

library ieee;
use ieee.std_logic_1164.all;

entity PriorityFinder is
  port (
    G1, G2, R1: in std_logic;
    X: in std_logic_vector(0 to 5);
    K1, K2: out std_logic
  );
end entity;

architecture Struct of PriorityFinder is
  signal T1: std_logic_vector(0 to 2);
  signal T2: std_logic_vector(0 to 16);
begin
  -- Component instances
  xor2: XOR_2 port map(I1 => G1, I2 => G2, O => T1(0));
  nand1: NAND_2 port map(I1 => G1, I2 => G2, O => T1(1));
  and10: AND_2 port map(I1 => T1(1), I2 => R1, O => T1(2));
  or3: OR_2 port map(I1 => T1(0), I2 => T1(2), O => K1);
  inv10: INVERTER port map(I => G1, O => T2(0));
  inv11: INVERTER port map(I => G2, O => T2(1));
  inv12: INVERTER port map(I => R1, O => T2(2));
  inv13: INVERTER port map(I => X(0), O => T2(3));
  inv14: INVERTER port map(I => X(1), O => T2(4));
  inv15: INVERTER port map(I => X(2), O => T2(5));
  inv16: INVERTER port map(I => X(3), O => T2(6));
  inv17: INVERTER port map(I => X(4), O => T2(7));
  inv18: INVERTER port map(I => X(5), O => T2(8));
  and11: AND_2 port map(I1 => T2(0), I2 => T2(1), O => T2(9));
  and12: AND_2 port map(I1 => T2(2), I2 => T2(9), O => T2(10));
  and13: AND_2 port map(I1 => T2(3), I2 => T2(10), O => T2(11));
  and14: AND_2 port map(I1 => T2(4), I2 => T2(11), O => T2(12));
  and15: AND_2 port map(I1 => T2(5), I2 => T2(12), O => T2(13));
  and16: AND_2 port map(I1 => T2(6), I2 => T2(13), O => T2(14));
  and17: AND_2 port map(I1 => T2(7), I2 => T2(14), O => T2(15));
  and18: AND_2 port map(I1 => T2(8), I2 => T2(15), O => T2(16));
  or4: OR_2 port map(I1 => T1(0), I2 => T2(16), O => K2);
end Struct;
