library ieee;
use ieee.std_logic_1164.all;

entity escalador is
	PORT(
		rst,clk : in std_logic;
		Xin : in std_logic;
		Q : out std_logic_vector(2 downto 0)
	);
end escalador;

architecture behavioral of escalador is
	type estado is (S0,S1,S2,S3,S4,S5,S6,S7);
	signal pr,sg : estado;
begin
	sec: process(rst,clk)
	begin
		if (rst = '1') then
			pr <= S0;
		elsif (rising_edge(clk)) then
		--elsif clk'event and clk='1' then
			pr <= sg;
		end if;
	end process sec;
	
	comb: process(pr,Xin)
	begin
		--Q<="000";
		case pr is
			when s0 =>
				Q<="000";
				if (Xin = '0') then
					sg <= s2;
					--Q <= "010";
				else
					sg <= s1;
					--Q <= "001";
				end if;
			when s1 =>
				Q <= "001";
				if (Xin = '0') then
					sg <= s2;
					--Q <= "010";
				else
					sg <= s3;
					--Q <= "011";
				end if;
			when s2 =>
				Q <= "010";
				if (Xin = '0') then
					sg <= s4;
					--Q <= "100";
				else
					sg <= s3;
					--Q <= "011";
				end if;
			when s3 =>
				Q <= "011";
				if (Xin = '0') then
					sg <= s4;
					--Q <= "100";
				else
					sg <= s5;
					--Q <= "101";
				end if;
			when s4 =>
				Q <= "100";
				if (Xin = '0') then
					sg <= s6;
					--Q <= "110";
				else
					sg <= s5;
					--Q <= "101";
				end if;
			when s5 =>
				Q <= "101";
				if (Xin = '0') then
					sg <= s6;
					--Q <= "110";
				else
					sg <= s7;
					--Q <= "111";
				end if;
			when s6 =>
				Q <= "110";
				if (Xin = '0') then
					sg <= s0;
					--Q <= "000";
				else
					sg <= s7;
					--Q <= "111";
				end if;
			when s7 =>
				Q <= "111";
				if (Xin = '0') then
					sg <= s0;
					--Q <= "000";
				else
					sg <= s1;
					--Q <= "001";
				end if;
		end case;
	end process comb;
end behavioral;
