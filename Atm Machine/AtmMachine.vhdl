library work;
use work.Gates.all;

library ieee;
use ieee.std_logic_1164.all;

entity AtmMachine is
  port (
    B: in std_logic_vector(0 to 7);
    B1: in std_logic_vector(0 to 7);
    B2: in std_logic_vector(0 to 7);
    U1, U2, G1: out std_logic;
    Y: out std_logic_vector(0 to 5)
  );
end entity;

architecture Struct of AtmMachine is
  signal x1, x2, y1: std_logic_vector(0 to 7);
  signal z1: std_logic_vector(0 to 5);
  signal z2: std_logic_vector(0 to 6);
  signal z3: std_logic_vector(0 to 1);

  component divider is
    generic (
      M : integer := 8;
      MM : integer := 16
    );
    port (
      Mu: in std_logic_vector(M-1 downto 0);
      C: in std_logic_vector(M-1 downto 0);
      ZQ: out std_logic_vector(MM-1 downto 0)
    );
  end component;

begin
  -- Component instances
  div3: divider port map(Mu(7 downto 0) => B(0 to 7), C(7 downto 0) => B1(0 to 7), ZQ(15 downto 8) => y1(0 to 7), ZQ(1) => U1, ZQ(0) => U2, ZQ(7 downto 2) => z1);
  div4: divider port map(Mu(7 downto 0) => y1(0 to 7), C(7 downto 0) => B2(0 to 7), ZQ(13 downto 8) => Y(0 to 5), ZQ(0) => G1, ZQ(7 downto 1) => z2, ZQ(15 downto 14) => z3);
end Struct;
