`timescale 1ns/1ps

module tb_pmos_transistor_logic;

    reg gate;
    reg source;
    wire drain;

    // Instantiate the module under test (uut)
    pmos_transistor_logic uut (
        .drain(drain),
        .gate(gate),
        .source(source)
    );

    initial begin
        // Test case 1: Gate is low, source is high
        source = 1'b1; 
        gate = 1'b0; 
        #10;
        if (drain !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected drain = 1, got drain = %b", drain);
            $finish;
        end

        // Test case 2: Gate is low, source is low
        source = 1'b0; 
        gate = 1'b0; 
        #10;
        if (drain !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected drain = 0, got drain = %b", drain);
            $finish;
        end

        // Test case 3: Gate is high, source is high
        source = 1'b1; 
        gate = 1'b1; 
        #10;
        if (drain !== 1'bz) begin
            $display("FAIL: Test case 3 failed, expected drain = Z, got drain = %b", drain);
            $finish;
        end

        // Test case 4: Gate is high, source is low
        source = 1'b0; 
        gate = 1'b1; 
        #10;
        if (drain !== 1'bz) begin
            $display("FAIL: Test case 4 failed, expected drain = Z, got drain = %b", drain);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule