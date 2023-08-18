library work;
use work.Gates.all;

entity Atm is
  port (
    A: in std_logic_vector(0 to 7);
    A1: in std_logic_vector(0 to 7);
    A2: in std_logic_vector(0 to 7);
    Y: out std_logic_vector(0 to 10)
  );
end entity Atm;

architecture Struct of Atm is

  signal H1, H2, F1: std_logic;
  signal Z: std_logic_vector(0 to 5);

  component AtmMachine is
    port (
      B: in std_logic_vector(0 to 7);
      B1: in std_logic_vector(0 to 7);
      B2: in std_logic_vector(0 to 7);
      U1, U2, G1: out std_logic;
      Y: out std_logic_vector(0 to 5)
    );
  end component AtmMachine;

begin
  nc1: AtmMachine
    port map (
      B => A,
      B1 => A1,
      B2 => A2,
      U1 => H1,
      U2 => H2,
      G1 => F1,
      Y => Z
    );

  Y(0) <= '0';
  Y(1) <= '0';
  Y(2) <= H1;
  Y(3) <= H2;
  Y(4) <= F1;
  Y(5 to 10) <= Z;

end Struct;
