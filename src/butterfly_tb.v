`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:20 03/17/2018
// Design Name:   butterfly
// Module Name:   /home/josh/cordic_fft/butterfly_tb.v
// Project Name:  cordic_fft
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: butterfly
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module butterfly_tb;

	// Inputs
	reg clock;
	reg [15:0] x1;
	reg [15:0] y1;
	reg [15:0] x2;
	reg [15:0] y2;
	reg [31:0] zangle;

	// Outputs
	wire [15:0] xout1;
	wire [15:0] yout1;
	wire [15:0] xout2;
	wire [15:0] yout2;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	butterfly uut (
		.clock(clock), 
		.x1(x1), 
		.y1(y1), 
		.x2(x2), 
		.y2(y2), 
		.zangle(zangle), 
		.xout1(xout1), 
		.yout1(yout1), 
		.xout2(xout2), 
		.yout2(yout2),
		.done(done)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		x1 = 0;
		y1 = 0;
		x2 = 0;
		y2 = 0;
		zangle = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Add stimulus here
		x1 =3200;
		y1 = 0;
		x2 = 3200;
		y2 = 0;
		//zangle = 'b00100000000000000000000000000000;
		zangle = 'b11100000000000000000000000000000; //-45 degrees
		//zangle = 0;
		
		 clock = 'b0;
		 forever
		 begin
			#5 clock = !clock;
		 end
		
	end
      
endmodule

