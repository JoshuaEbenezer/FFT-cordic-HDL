`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:39:33 03/17/2018
// Design Name:   cordic
// Module Name:   /home/josh/cordic_fft/cordic_tb.v
// Project Name:  cordic_fft
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cordic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cordic_tb;

	// Inputs
	reg clock;
	reg [15:0] xstart;
	reg [15:0] ystart;
	reg [31:0] zangle;

	// Outputs
	wire [15:0] xout;
	wire [15:0] yout;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	cordic uut (
		.clock(clock), 
		.xstart(xstart), 
		.ystart(ystart), 
		.zangle(zangle), 
		.xout(xout), 
		.yout(yout), 
		.done(done)
	);


	initial begin
		// Initialize Inputs
		clock = 0;
		xstart = 0;
		ystart = 0;
		zangle = 0;

		
		
		// Wait 100 ns for global reset to finish
		#100;
		
		// Add stimulus here
		xstart =32000;
		ystart = 0;
		//zangle = 'b00100000000000000000000000000000;
		zangle = 'b01110101010101010101010101010101;
		 
		 clock = 'b0;
		 forever
		 begin
			#5 clock = !clock;
		 end
        
		// Add stimulus here
		//xstart = 3200;
		//ystart = 0;
		//zangle = 'b00100000000000000000000000000000;

	end
      
endmodule

