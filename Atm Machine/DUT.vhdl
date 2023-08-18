library ieee;
use ieee.std_logic_1164.all;

entity ModifiedDUT is
   port (
      input_vector: in std_logic_vector(7 downto 0);
      output_vector: out std_logic_vector(10 downto 0)
   );
end entity;

architecture DutWrap of ModifiedDUT is
   component ModifiedAtmMachine is
      port (
         B: in std_logic_vector(0 to 7);
         B1: in std_logic_vector(0 to 7);
         B2: in std_logic_vector(0 to 7);
         U1, U2, G1: out std_logic;
         Y: out std_logic_vector(0 to 5)
      );
   end component;

   signal dut_input : std_logic_vector(7 downto 0);
   signal atm_output : std_logic_vector(10 downto 0);

begin
   dut_instance: ModifiedAtmMachine
      port map (
         B => dut_input,
         B1 => ('0','1','1','0','0','1','0','0'),
         B2 => ('0','0','1','1','0','0','1','0'),
         U1 => U1,
         U2 => U2,
         G1 => G1,
         Y => atm_output
      );

   dut_input <= input_vector;
   output_vector <= atm_output;
end DutWrap;
