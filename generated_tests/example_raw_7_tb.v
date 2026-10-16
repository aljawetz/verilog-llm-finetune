`timescale 1ns/1ps

module tb_example_raw;

    reg [255:0] a;
    wire [255:0] s;

    // Instantiate the module under test
    example_raw uut (
        .a(a),
        .s(s)
    );

    initial begin
        // Initialize inputs
        a = 256'b0;

        // Test case 1: Check with all zeros
        #10;
        if (s !== 256'b0) begin
            $display("FAIL: Test case 1 failed, expected s = 0, got s = %b", s);
            $finish;
        end

        // Test case 2: Check with all ones
        a = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        #10;
        if (s !== 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF) begin
            $display("FAIL: Test case 2 failed, expected s = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, got s = %b", s);
            $finish;
        end

        // Test case 3: Check with alternating bits
        a = 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
        #10;
        if (s !== 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA) begin
            $display("FAIL: Test case 3 failed, expected s = AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA, got s = %b", s);
            $finish;
        end

        // Test case 4: Check with a specific pattern
        a = 256'h1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF;
        #10;
        if (s !== 256'h1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF) begin
            $display("FAIL: Test case 4 failed, expected s = 1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF, got s = %b", s);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule