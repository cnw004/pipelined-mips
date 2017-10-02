/*
module to act as data memory for our processor

inputs:
  - mem_write: comes out of control, decides if we should write or not
  - address: where in data memory should we write to
  - write_data: data to be written to memory

outputs:
  - read_data: data read from memory
*/

module data_memory(
  input wire mem_write,
  input wire [31:0] address,
  input wire [31:0] write_data,
  output reg [31:0] read_data);

  //declare the memory
  reg [31:0] data_mem [32'h7FFF0000:32'h7FFFFFFC]; //not entirely sure this is correct

  //always read / write when channges happen.
  always @(mem_write, address)
    begin
      if(mem_write == 1)
        data_mem[address] = write_data;
      else
        read_data = data_mem[address];
    end

endmodule
