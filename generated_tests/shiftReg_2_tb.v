`timescale 1ns/1ps

module tb_shiftReg;

parameter DATAWIDTH = 8;
reg i_clk;
reg i_rst;
reg i_shift;
reg i_load;
reg [DATAWIDTH-1:0] i_data;
wire [DATAWIDTH-1:0] o_data;

// Instantiate the shift register module
shiftReg uut (
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_shift(i_shift),
    .i_load(i_load),
    .i_data(i_data),
    .o_data(o_data)
);

// Clock generation
initial begin
    i_clk = 0;
    forever #5 i_clk = ~i_clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    i_rst = 0;
    i_shift = 0;
    i_load = 0;
    i_data = 8'b00000000;

    // Apply reset
    #10;
    i_rst = 1; // Release reset
    #10;

    // Test loading data
    i_data = 8'b10101010;
    i_load = 1; // Load data
    #10;
    i_load = 0; // Stop loading

    // Check if data is loaded correctly
    if (o_data !== 8'b10101010) begin
        $display("FAIL: Data not loaded correctly");
        $finish;
    end

    // Test shifting
    i_shift = 1; // Start shifting
    #10;
    i_shift = 0; // Stop shifting

    // Check if data is shifted correctly
    if (o_data !== 8'b01010101) begin
        $display("FAIL: Data not shifted correctly");
        $finish;
    end

    // Shift again
    i_shift = 1; // Start shifting
    #10;
    i_shift = 0; // Stop shifting

    // Check if data is shifted correctly
    if (o_data !== 8'b00101010) begin
        $display("FAIL: Data not shifted correctly");
        $finish;
    end

    // Test reset functionality
    i_rst = 0; // Assert reset
    #10;
    i_rst = 1; // Release reset

    // Check if data is reset correctly
    if (o_data !== 8'b00000000) begin
        $display("FAIL: Data not reset correctly");
        $finish;
    end

    // Test loading new data after reset
    i_data = 8'b11110000;
    i_load = 1; // Load new data
    #10;
    i_load = 0; // Stop loading

    // Check if new data is loaded correctly
    if (o_data !== 8'b11110000) begin
        $display("FAIL: New data not loaded correctly");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule