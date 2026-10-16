`timescale 1ns/1ps

module tb_mux;

//-----------Input Ports---------------
reg [7:0] din_0;
reg [7:0] din_1; 
reg sel;
//-----------Output Ports---------------
wire [7:0] mux_out;

// Instantiate the module under test (uut)
mux uut (
    .din_0(din_0),
    .din_1(din_1),
    .sel(sel),
    .mux_out(mux_out)
);

// Test procedure
initial begin
    // Test case 1: sel = 0, expect mux_out = din_0
    din_0 = 8'hAA; // 10101010
    din_1 = 8'h55; // 01010101
    sel = 0;
    #10; // Wait for 10 time units
    if (mux_out !== din_0) begin
        $display("FAIL: Test case 1 failed, expected %h but got %h", din_0, mux_out);
        $finish;
    end

    // Test case 2: sel = 1, expect mux_out = din_1
    sel = 1;
    #10; // Wait for 10 time units
    if (mux_out !== din_1) begin
        $display("FAIL: Test case 2 failed, expected %h but got %h", din_1, mux_out);
        $finish;
    end

    // Test case 3: Change inputs and test again
    din_0 = 8'hFF; // 11111111
    din_1 = 8'h00; // 00000000
    sel = 0;
    #10; // Wait for 10 time units
    if (mux_out !== din_0) begin
        $display("FAIL: Test case 3 failed, expected %h but got %h", din_0, mux_out);
        $finish;
    end

    sel = 1;
    #10; // Wait for 10 time units
    if (mux_out !== din_1) begin
        $display("FAIL: Test case 4 failed, expected %h but got %h", din_1, mux_out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule