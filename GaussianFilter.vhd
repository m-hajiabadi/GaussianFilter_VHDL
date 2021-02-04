----------------------------------------------------------------------------------
-- Company: K.N.TOOSI UNIVERSITY of TECHNOLOGY
-- Engineer: Behnam Esmaeilbeigi and Morteza Hajiabadi
-- 
-- Create Date:    13:30:06 02/04/2021 
-- Design Name: 
-- Module Name:    GaussianFilter - Behavioral 
-- Project Name: FPGA_FINAL_PROJECT
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL; 
use std.textio.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GaussianFilter is
	port(
		clk : in std_logic;
		pixel_out : out std_logic_vector(15 downto 0)
	);
end GaussianFilter;

architecture Behavioral of GaussianFilter is
	type array_9 is array (0 to 8) of std_logic_vector(7 downto 0); 
	
	--should change to image pixels number
	type array_ram is array (0 to 16383) of std_logic_vector(7 downto 0);
	
	--should initialize width kernel number !
	signal kernel : array_9 := ((X"01"),(X"02"),(X"01"),(X"02"),(X"04"),(X"02"),(X"01"),(X"02"),(X"01"));
	
	--initialize ram
	type RamType is array (0 to 16383) of bit_vector(7 downto 0); 
	impure function InitRamFromFile(RamFileName : in string) return RamType is  
		FILE RamFile : text is in RamFileName;  
		variable RamFileLine : line;  
		variable RAM         : RamType; 
		begin  
		for I in RamType'range loop   
			readline(RamFile, RamFileLine);   
			read(RamFileLine, RAM(I));  
		end loop;  
		return RAM; 
	end function;
	signal ram : RamType := InitRamFromFile("noisy_image.txt");
	
	-- base size should change 
	signal img_width:integer range 0 to 255:=128;
	signal img_height:integer range 0 to 255:=128;
	
	-- base pixel number ( number of row * img_width)
	signal base :integer range 0 to 255 :=img_width;
	signal i : integer range 0 to 255 := 1 ;
	signal m1,m2,m3,m4,m5,m6,m7,m8,m9 : std_logic_vector(15 downto 0) :=(others =>'0');
	signal temp :std_logic_vector(15 downto 0) :=  (others =>'0');
	--outputfile 
	--first of all initializign ram must done 
begin
	process(clk)
		begin
		if(clk'event and clk='1' )then 
			m1 <= to_stdlogicvector(ram(i - img_width -1 +base)) * kernel(0);
			m2 <= to_stdlogicvector(ram(i - img_width +base)) * kernel(1);
			m3 <= to_stdlogicvector(ram(i - img_width + 1 +base)) * kernel(2);
	
			m4 <= to_stdlogicvector(ram(i + base-1)) * kernel(3);
			m5 <= to_stdlogicvector(ram(i  + base)) * kernel(4);
			m6 <= to_stdlogicvector(ram(i  + 1 +base )) * kernel(5);
	
			m7 <= to_stdlogicvector(ram(i + img_width -1 +base)) * kernel(6);
			m8 <= to_stdlogicvector(ram(i + img_width +base)) * kernel(7);
			m9 <= to_stdlogicvector(ram(i + img_width + 1 +base)) * kernel(8);
	
			temp <= (m1+m2+m3+m4+m5+m6+m7+m8+m9) ;

			i <= i+1 ;
			if(i  >= img_width - 2 ) then 
				base <= base + img_width ;
				i <= 1;
			end if ;
		end if ;
	end process ;
	
	pixel_out <= "0000" & temp(15 downto 4);


--conv output divide by 4 goes to output

end Behavioral;

