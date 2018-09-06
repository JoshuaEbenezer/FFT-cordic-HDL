`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:38:30 03/20/2018
// Design Name:   main_cordic_fft
// Module Name:   /home/josh/cordic_fft/main_tb.v
// Project Name:  cordic_fft
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_cordic_fft
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_tb;

	// Inputs
	reg [15:0] xin1;
	reg [15:0] xin2;
	reg [15:0] xin3;
	reg [15:0] xin4;
	reg [15:0] xin5;
	reg [15:0] xin6;
	reg [15:0] xin7;
	reg [15:0] xin8;
	reg [15:0] xin9;
	reg [15:0] xin10;
	reg [15:0] xin11;
	reg [15:0] xin12;
	reg [15:0] xin13;
	reg [15:0] xin14;
	reg [15:0] xin15;
	reg [15:0] xin16;
	reg [15:0] yin1;
	reg [15:0] yin2;
	reg [15:0] yin3;
	reg [15:0] yin4;
	reg [15:0] yin5;
	reg [15:0] yin6;
	reg [15:0] yin7;
	reg [15:0] yin8;
	reg [15:0] yin9;
	reg [15:0] yin10;
	reg [15:0] yin11;
	reg [15:0] yin12;
	reg [15:0] yin13;
	reg [15:0] yin14;
	reg [15:0] yin15;
	reg [15:0] yin16;
	reg clock;

	// Outputs
	wire [255:0] xout;
	wire [255:0] yout;

	// Instantiate the Unit Under Test (UUT)
	main_cordic_fft uut (
		.xin1(xin1), 
		.xin2(xin2), 
		.xin3(xin3), 
		.xin4(xin4), 
		.xin5(xin5), 
		.xin6(xin6), 
		.xin7(xin7), 
		.xin8(xin8), 
		.xin9(xin9), 
		.xin10(xin10), 
		.xin11(xin11), 
		.xin12(xin12), 
		.xin13(xin13), 
		.xin14(xin14), 
		.xin15(xin15), 
		.xin16(xin16), 
		.yin1(yin1), 
		.yin2(yin2), 
		.yin3(yin3), 
		.yin4(yin4), 
		.yin5(yin5), 
		.yin6(yin6), 
		.yin7(yin7), 
		.yin8(yin8), 
		.yin9(yin9), 
		.yin10(yin10), 
		.yin11(yin11), 
		.yin12(yin12), 
		.yin13(yin13), 
		.yin14(yin14), 
		.yin15(yin15), 
		.yin16(yin16), 
		.xout(xout), 
		.yout(yout), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		xin1 = 0;
		xin2 = 0;
		xin3 = 0;
		xin4 = 0;
		xin5 = 0;
		xin6 = 0;
		xin7 = 0;
		xin8 = 0;
		xin9 = 0;
		xin10 = 0;
		xin11 = 0;
		xin12 = 0;
		xin13 = 0;
		xin14 = 0;
		xin15 = 0;
		xin16 = 0;
		yin1 = 0;
		yin2 = 0;
		yin3 = 0;
		yin4 = 0;
		yin5 = 0;
		yin6 = 0;
		yin7 = 0;
		yin8 = 0;
		yin9 = 0;
		yin10 = 0;
		yin11 = 0;
		yin12 = 0;
		yin13 = 0;
		yin14 = 0;
		yin15 = 0;
		yin16 = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		xin1=   3200;
		xin2 = 3200;
		xin3 = 3200;
		xin4 = 3200;
		xin5 = 3200;
		xin6 = 3200;
		xin7 = 3200;
		xin8 = 3200;
		xin9 = 3200;
		xin10 = 3200;
          
		xin11= 3200;
	    xin12 = 3200;
	    xin13 = 3200;
	    xin14 = 3200;
	    xin15 = 3200;
	    xin16 = 3200;
	    
    		

		//xin2='b0000011111001101;
		//xin3='b0000000110100110;
		//xin4='b0000000110100110;
		//xin5='b0000011111001101;
		//xin6='b0000010000000000;
		//xin7='b0000000000110010;
		//xin8='b0000011001011001;
		//xin9='b0000011001011001;
		//xin10='b0000000000110010;
		//xin11='b0000001111111111;
		//xin12='b0000011111001101;
		//xin13='b0000000110100110;
		//xin14='b0000000110100110;
		//xin15='b0000011111001101;
		//xin16='b0000010000000000;
		
	
		#1000

		$display(" The input is x = %b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n  y=%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n \n",xin1,xin2,xin3,xin4,xin5,xin6,xin7,xin8,xin9,xin10,xin11,xin12,xin13,xin14,xin15,xin16,yin1,yin2,yin3,yin4,yin5,yin6,yin7,yin8,yin9,yin10,yin11,yin12,yin13,yin14,yin15,yin16);
	
		$display(" The result is %b\n%b \n",xout,yout);
		
	end
	initial begin
		#100
		clock ='b0;
		forever
		begin
			#5
			clock=!clock;
		end
		
	end
      
endmodule

