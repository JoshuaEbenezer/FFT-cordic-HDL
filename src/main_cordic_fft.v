`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:54 03/17/2018 
// Design Name: 
// Module Name:    main_cordic_fft 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main_cordic_fft(xin1,xin2,xin3,xin4,xin5,xin6,xin7,xin8,xin9,xin10,xin11,xin12,xin13,xin14,xin15,xin16,
								yin1,yin2,yin3,yin4,yin5,yin6,yin7,yin8,yin9,yin10,yin11,yin12,yin13,yin14,yin15,yin16,xout,yout,clock);

	input signed [15:0] xin1;
	input signed [15:0] xin2;
	input signed [15:0] xin3;
	input signed [15:0] xin4;
	input signed [15:0] xin5;
	input signed [15:0] xin6;
	input signed [15:0] xin7;
	input signed [15:0] xin8;
	input signed [15:0] xin9;
	input signed [15:0] xin10;
	input signed [15:0] xin11;
	input signed [15:0] xin12;
	input signed [15:0] xin13;
	input signed [15:0] xin14;
	input signed [15:0] xin15;
	input signed [15:0] xin16;
	
	input signed [15:0] yin1;
	input signed [15:0] yin2;
	input signed [15:0] yin3;
	input signed [15:0] yin4;
	input signed [15:0] yin5;
	input signed [15:0] yin6;
	input signed [15:0] yin7;
	input signed [15:0] yin8;
	input signed [15:0] yin9;
	input signed [15:0] yin10;
	input signed [15:0] yin11;
	input signed [15:0] yin12;
	input signed [15:0] yin13;
	input signed [15:0] yin14;
	input signed [15:0] yin15;
	input signed [15:0] yin16;
	
//input signed [255:0] xin;		//flattened version of [15:0] xin[0:15]
//input signed [255:0] yin;
output signed [255:0] xout;
output signed [255:0] yout;

input clock;

genvar i;

wire signed [31:0] angle_lut [0:7];

assign angle_lut[0] = 'b00000000000000000000000000000000;
assign angle_lut[1] = 'b11110000000000000000000000000000;
assign angle_lut[2] = 'b11100000000000000000000000000000;
assign angle_lut[3] = 'b11010000000000000000000000000000;
assign angle_lut[4] = 'b11000000000000000000000000000000;
assign angle_lut[5] = 'b10110000000000000000000000000000;
assign angle_lut[6] = 'b10100000000000000000000000000000;
assign angle_lut[7] = 'b10010000000000000000000000000000;

wire signed[15:0] xtemp_in[0:15];
wire signed[15:0] ytemp_in[0:15];

wire signed[15:0] xtemp_out[0:15];
wire signed[15:0] ytemp_out[0:15];

assign {xtemp_in[0],xtemp_in[1],xtemp_in[2],xtemp_in[3],xtemp_in[4],xtemp_in[5],xtemp_in[6],xtemp_in[7],xtemp_in[8],xtemp_in[9],xtemp_in[10],xtemp_in[11],xtemp_in[12],xtemp_in[13],xtemp_in[14],xtemp_in[15]} = {xin1,xin2,xin3,xin4,xin5,xin6,xin7,xin8,xin9,xin10,xin11,xin12,xin13,xin14,xin15,xin16};
assign {ytemp_in[0],ytemp_in[1],ytemp_in[2],ytemp_in[3],ytemp_in[4],ytemp_in[5],ytemp_in[6],ytemp_in[7],ytemp_in[8],ytemp_in[9],ytemp_in[10],ytemp_in[11],ytemp_in[12],ytemp_in[13],ytemp_in[14],ytemp_in[15]} = {yin1,yin2,yin3,yin4,yin5,yin6,yin7,yin8,yin9,yin10,yin11,yin12,yin13,yin14,yin15,yin16};

wire signed[15:0] xtemp1[0:15];
wire signed[15:0] ytemp1[0:15];

wire signed[15:0] xtemp2[0:15];
wire signed[15:0] ytemp2[0:15];

wire signed[15:0] xtemp3[0:15];
wire signed[15:0] ytemp3[0:15];

wire done1[3:0];

generate
for (i=0;i<8;i=i+1)
begin: butterflies1
	butterfly b1(.clock(clock),.x1(xtemp_in[i]),.y1(ytemp_in[i]),.x2(xtemp_in[i+8]),.y2(ytemp_in[i+8]),.zangle(angle_lut[i]),.xout1(xtemp1[i]),.yout1(ytemp1[i]),.xout2(xtemp1[i+8]),.yout2(ytemp1[i+8]));
end
endgenerate



generate
for (i=0;i<4;i=i+1)
begin: butterflies2
	butterfly b2(.clock(clock),.x1(xtemp1[i]),.y1(ytemp1[i]),.x2(xtemp1[i+4]),.y2(ytemp1[i+4]),.zangle(angle_lut[2*i]),.xout1(xtemp2[i]),.yout1(ytemp2[i]),.xout2(xtemp2[i+4]),.yout2(ytemp2[i+4]));
	butterfly b3(.clock(clock),.x1(xtemp1[i+8]),.y1(ytemp1[i+8]),.x2(xtemp1[i+12]),.y2(ytemp1[i+12]),.zangle(angle_lut[2*i]),.xout1(xtemp2[i+8]),.yout1(ytemp2[i+8]),.xout2(xtemp2[i+12]),.yout2(ytemp2[i+12]));
end
endgenerate


generate
for (i=0;i<2;i=i+1)
begin: butterflies3
	butterfly b4(.clock(clock),.x1(xtemp2[i]),.y1(ytemp2[i]),.x2(xtemp2[i+2]),.y2(ytemp2[i+2]),.zangle(angle_lut[4*i]),.xout1(xtemp3[i]),.yout1(ytemp3[i]),.xout2(xtemp3[i+2]),.yout2(ytemp3[i+2]));
	butterfly b5(.clock(clock),.x1(xtemp2[i+4]),.y1(ytemp2[i+4]),.x2(xtemp2[i+6]),.y2(ytemp2[i+6]),.zangle(angle_lut[4*i]),.xout1(xtemp3[i+4]),.yout1(ytemp3[i+4]),.xout2(xtemp3[i+6]),.yout2(ytemp3[i+6]));
	butterfly b6(.clock(clock),.x1(xtemp2[i+8]),.y1(ytemp2[i+8]),.x2(xtemp2[i+10]),.y2(ytemp2[i+10]),.zangle(angle_lut[4*i]),.xout1(xtemp3[i+8]),.yout1(ytemp3[i+8]),.xout2(xtemp3[i+10]),.yout2(ytemp3[i+10]));
	butterfly b7(.clock(clock),.x1(xtemp2[i+12]),.y1(ytemp2[i+12]),.x2(xtemp2[i+14]),.y2(ytemp2[i+14]),.zangle(angle_lut[4*i]),.xout1(xtemp3[i+12]),.yout1(ytemp3[i+12]),.xout2(xtemp3[i+14]),.yout2(ytemp3[i+14]));
end
endgenerate

butterfly b8(.clock(clock),.x1(xtemp3[0]),.y1(ytemp3[0]),.x2(xtemp3[1]),.y2(ytemp3[1]),.zangle(angle_lut[0]),.xout1(xtemp_out[0]),.yout1(ytemp_out[0]),.xout2(xtemp_out[8]),.yout2(ytemp_out[8]));
butterfly b9(.clock(clock),.x1(xtemp3[2]),.y1(ytemp3[2]),.x2(xtemp3[3]),.y2(ytemp3[3]),.zangle(angle_lut[0]),.xout1(xtemp_out[4]),.yout1(ytemp_out[4]),.xout2(xtemp_out[12]),.yout2(ytemp_out[12]));
butterfly b10(.clock(clock),.x1(xtemp3[4]),.y1(ytemp3[4]),.x2(xtemp3[5]),.y2(ytemp3[5]),.zangle(angle_lut[0]),.xout1(xtemp_out[2]),.yout1(ytemp_out[2]),.xout2(xtemp_out[10]),.yout2(ytemp_out[10]));
butterfly b11(.clock(clock),.x1(xtemp3[6]),.y1(ytemp3[6]),.x2(xtemp3[7]),.y2(ytemp3[7]),.zangle(angle_lut[0]),.xout1(xtemp_out[6]),.yout1(ytemp_out[6]),.xout2(xtemp_out[14]),.yout2(ytemp_out[14]));

butterfly b12(.clock(clock),.x1(xtemp3[8]),.y1(ytemp3[8]),.x2(xtemp3[9]),.y2(ytemp3[9]),.zangle(angle_lut[0]),.xout1(xtemp_out[1]),.yout1(ytemp_out[1]),.xout2(xtemp_out[9]),.yout2(ytemp_out[9]));
butterfly b13(.clock(clock),.x1(xtemp3[10]),.y1(ytemp3[10]),.x2(xtemp3[11]),.y2(ytemp3[11]),.zangle(angle_lut[0]),.xout1(xtemp_out[5]),.yout1(ytemp_out[5]),.xout2(xtemp_out[13]),.yout2(ytemp_out[13]));
butterfly b14(.clock(clock),.x1(xtemp3[12]),.y1(ytemp3[12]),.x2(xtemp3[13]),.y2(ytemp3[13]),.zangle(angle_lut[0]),.xout1(xtemp_out[3]),.yout1(ytemp_out[3]),.xout2(xtemp_out[11]),.yout2(ytemp_out[11]));
butterfly b15(.clock(clock),.x1(xtemp3[14]),.y1(ytemp3[14]),.x2(xtemp3[15]),.y2(ytemp3[15]),.zangle(angle_lut[0]),.xout1(xtemp_out[7]),.yout1(ytemp_out[7]),.xout2(xtemp_out[15]),.yout2(ytemp_out[15]));

assign xout = {xtemp_out[15],xtemp_out[14],xtemp_out[13],xtemp_out[12],xtemp_out[11],xtemp_out[10],xtemp_out[9],xtemp_out[8],xtemp_out[7],xtemp_out[6],xtemp_out[5],xtemp_out[4],xtemp_out[3],xtemp_out[2],xtemp_out[1],xtemp_out[0]};
assign yout = {ytemp_out[15],ytemp_out[14],ytemp_out[13],ytemp_out[12],ytemp_out[11],ytemp_out[10],ytemp_out[9],ytemp_out[8],ytemp_out[7],ytemp_out[6],ytemp_out[5],ytemp_out[4],ytemp_out[3],ytemp_out[2],ytemp_out[1],ytemp_out[0]};

endmodule