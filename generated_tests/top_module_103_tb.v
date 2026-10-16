`timescale 1ns/1ps

module tb_top_module;

    reg [255:0] in;
    reg [7:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    top_module uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select the first bit
        in = 256'h0000000000000000000000000000000000000000000000000000000000000001; // Only the last bit is 1
        sel = 8'h00; // Select the first bit
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 1 failed, expected out = 0, got out = %b", out);

        // Test case 2: Select the last bit
        sel = 8'hFF; // Select the last bit
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: Select a middle bit
        sel = 8'h80; // Select the middle bit
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);

        // Test case 4: Select another bit
        in = 256'h00000000000000000000000000000000000000000000000000000000000000FF; // Last 8 bits are 1
        sel = 8'h07; // Select the 8th bit
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

        // Test case 5: Select a bit that is 0
        sel = 8'h01; // Select the second bit
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule