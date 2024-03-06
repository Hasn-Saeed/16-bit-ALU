library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevseg_1 is
    Port ( int : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end sevseg_1;

architecture Behavioral of sevseg_1 is
begin
    decode: process(int)
    begin
        case (int) is
            when "0000" => seg <= "0000001";     
            when "0001" => seg <= "1001111"; 
            when "0010" => seg <= "0010010"; 
            when "0011" => seg <= "0000110"; 
            when "0100" => seg <= "1001100"; 
            when "0101" => seg <= "0100100"; 
            when "0110" => seg <= "0100000"; 
            when "0111" => seg <= "0001111"; 
            when "1000" => seg <= "0000000";     
            when "1001" => seg <= "0000100"; 
            when "1010" => seg <= "0000010";
            when "1011" => seg <= "1100000";
            when "1100" => seg <= "0110001";
            when "1101" => seg <= "1000010";
            when "1110" => seg <= "0110000";
            when "1111" => seg <= "0111000";
            when others => seg <= "1111111";
        end case;
    end process;

end Behavioral;
