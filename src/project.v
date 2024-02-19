/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_mircearstan_JohnsonCounter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

parameter size=7;
//input clk;
//input r;
//output [0:size]out;

reg [0:size]out;

    always @ (posedge clk or negedge rst_n)
	begin
        if (~rst_n) 
			out= 8'b0000_0000;
		else
			out={~out[size],out[0:size-1]};   
	end

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = out;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

endmodule
