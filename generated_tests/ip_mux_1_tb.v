`timescale 1ns/1ps

module tb_ip_mux;

  // Parameters
  parameter PA_IP = 3;
  parameter PA_HL = 2;
  parameter PA_DATA = 32;
  parameter PA_IMME = 16;

  // Inputs
  reg clk;
  reg rst_b;
  reg [PA_IP-1:0] ip_sel;
  reg [PA_HL-1:0] hl_sel;
  reg [PA_DATA-1:0] rtr_out;
  reg [PA_DATA-1:0] alu_out;
  reg [PA_DATA-1:0] dib;
  reg [PA_IMME-1:0] id_imme;

  // Outputs
  wire [PA_DATA-1:0] mux_out;

  // Instantiate the Unit Under Test (UUT)
  ip_mux uut (
    .clk(clk),
    .rst_b(rst_b),
    .ip_sel(ip_sel),
    .hl_sel(hl_sel),
    .rtr_out(rtr_out),
    .alu_out(alu_out),
    .dib(dib),
    .id_imme(id_imme),
    .mux_out(mux_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_b = 0;
    ip_sel = 0;
    hl_sel = 0;
    rtr_out = 32'hA5A5A5A5;
    alu_out = 32'h5A5A5A5A;
    dib = 32'hDEADBEEF;
    id_imme = 16'h1234;

    // Reset the DUT
    #10;
    rst_b = 1;

    // Test case 1: Select rtr_out
    ip_sel = 3'b001;
    #10;
    if (mux_out !== rtr_out) begin
      $display("FAIL: Test case 1 failed, expected %h, got %h", rtr_out, mux_out);
      $finish;
    end

    // Test case 2: Select alu_out
    ip_sel = 3'b010;
    #10;
    if (mux_out !== alu_out) begin
      $display("FAIL: Test case 2 failed, expected %h, got %h", alu_out, mux_out);
      $finish;
    end

    // Test case 3: Select dib
    ip_sel = 3'b011;
    #10;
    if (mux_out !== dib) begin
      $display("FAIL: Test case 3 failed, expected %h, got %h", dib, mux_out);
      $finish;
    end

    // Test case 4: Select immediate value (lower half)
    ip_sel = 3'b100;
    hl_sel = 2'b00; // Lower half
    #10;
    if (mux_out !== {16'd0, id_imme}) begin
      $display("FAIL: Test case 4 failed, expected %h, got %h", {16'd0, id_imme}, mux_out);
      $finish;
    end

    // Test case 5: Select immediate value (upper half)
    hl_sel = 2'b10; // Upper half
    #10;
    if (mux_out !== {id_imme, 16'd0}) begin
      $display("FAIL: Test case 5 failed, expected %h, got %h", {id_imme, 16'd0}, mux_out);
      $finish;
    end

    // Test case 6: Select nothing
    ip_sel = 3'b000;
    #10;
    if (mux_out !== 32'd0) begin
      $display("FAIL: Test case 6 failed, expected 0, got %h", mux_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule