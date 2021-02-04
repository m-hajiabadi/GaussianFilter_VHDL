--------------------------------------------------------------------------------
-- Company: K.N.TOOSI UNIVERSITY of TECHNOLOGY
-- Engineer:	Behnam Esmaeilbeigi and Morteza Hajiabadi
--
-- Create Date:   14:20:11 02/04/2021
-- Design Name:   
-- Module Name:   E:/Uni/term7/FPGA/Project/FPGA_FINAL_PROJECT/GaussianFilterTestBench.vhd
-- Project Name:  FPGA_FINAL_PROJECT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GaussianFilter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 
USE ieee.std_logic_unsigned.ALL; 
USE ieee.std_logic_textio.ALL; 
USE std.textio.ALL; 

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY GaussianFilterTestBench IS
END GaussianFilterTestBench;
 
ARCHITECTURE behavior OF GaussianFilterTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GaussianFilter
    PORT(
         clk : IN  std_logic;
         pixel_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal pixel_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   --constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GaussianFilter PORT MAP (
          clk => clk,
          pixel_out => pixel_out
        );

   clk<= not clk after 5 ns;
	
	process(clk) 
		file file_out : text is out "smoothed_image.txt";  	
		variable line_out : line;  	
		variable output_tmp : integer range 0 to 255; 
 	 	begin 
 	 	 	if (rising_edge (clk)) then   	 	 	 	
			output_tmp := to_integer(unsigned (pixel_out));  	 	 	 	
			write(line_out, output_tmp);  	 	 	 	
			writeline(file_out , line_out); 
 	 	 	end if; 
	end process; 

END;
