`timescale 1ns/1ps

module tb_tristate_buffer;

    // Testbench signals
    reg in;
    reg en;
    wire out;

    // Instantiate the module under test (uut)
    tristate_buffer uut (
        .in(in),
        .en(en),
        .out(out)
    );

    // Test procedure
    initial begin
        // Test case 1: Enable is high, input is high
        in = 1'b1; 
        en = 1'b1; 
        #10; 
        if (out !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 2: Enable is high, input is low
        in = 1'b0; 
        en = 1'b1; 
        #10; 
        if (out !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 3: Enable is low, input is high
        in = 1'b1; 
        en = 1'b0; 
        #10; 
        if (out !== 1'bz) begin
            $display("FAIL: Test case 3 failed, expected out = Z, got out = %b", out);
            $finish;
        end

        // Test case 4: Enable is low, input is low
        in = 1'b0; 
        en = 1'b0; 
        #10; 
        if (out !== 1'bz) begin
            $display("FAIL: Test case 4 failed, expected out = Z, got out = %b", out);
            $finish;
        end

        // Test case 5: Enable toggling
        in = 1'b1; 
        en = 1'b1; 
        #10; 
        en = 1'b0; 
        #10; 
        if (out !== 1'bz) begin
            $display("FAIL: Test case 5 failed, expected out = Z, got out = %b", out);
            $finish;
        end

        // Test case 6: Enable toggling back
        en = 1'b1; 
        #10; 
        if (out !== 1'b1) begin
            $display("FAIL: Test case 6 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule