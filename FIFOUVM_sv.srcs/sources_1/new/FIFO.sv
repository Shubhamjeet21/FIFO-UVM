`timescale 1ns / 1ps
module FIFO(
  input logic clock,
  input logic rst,
  input logic wr,
  input logic rd,
  input logic [7:0] data_in,
  output logic [7:0] data_out,
  output logic empty,
  output logic full
);
  logic [7:0] mem [15:0];
  logic [3:0] rd_ptr, wr_ptr, count;

  assign empty = (count == 0);
  assign full  = (count == 16);

  always_ff @(posedge clock or posedge rst) begin
    if (rst) begin
      rd_ptr <= 0;
      wr_ptr <= 0;
      count  <= 0;
    end else begin
      if (wr && !full) begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
        count <= count + 1;
      end
      if (rd && !empty) begin
        data_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
        count <= count - 1;
      end
    end
  end
endmodule
