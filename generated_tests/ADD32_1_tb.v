`timescale 1ns/1ps

module tb_ADD32;

    // Inputs
    reg [31:0] D0;
    reg [31:0] D1;

    // Output
    wire [31:0] Q;

    // Instantiate the Unit Under Test (UUT)
    ADD32 uut (
        .D0(D0),
        .D1(D1),
        .Q(Q)
    );

    initial begin
        // Test case 1: Simple addition
        D0 = 32'h00000001; // 1
        D1 = 32'h00000001; // 1
        #10;
        if (Q !== 32'h00000002) begin
            $display("FAIL: Test case 1 failed, expected 2 but got %h", Q);
            $finish;
        end

        // Test case 2: Adding zero
        D0 = 32'h00000000; // 0
        D1 = 32'h00000001; // 1
        #10;
        if (Q !== 32'h00000001) begin
            $display("FAIL: Test case 2 failed, expected 1 but got %h", Q);
            $finish;
        end

        // Test case 3: Maximum values
        D0 = 32'hFFFFFFFF; // Max value
        D1 = 32'h00000001; // 1
        #10;
        if (Q !== 32'h00000000) begin // Overflow case
            $display("FAIL: Test case 3 failed, expected 0 but got %h", Q);
            $finish;
        end

        // Test case 4: Large numbers
        D0 = 32'h7FFFFFFF; // Max positive value
        D1 = 32'h00000001; // 1
        #10;
        if (Q !== 32'h80000000) begin // Overflow to negative
            $display("FAIL: Test case 4 failed, expected 80000000 but got %h", Q);
            $finish;
        end

        // Test case 5: Negative and positive
        D0 = 32'hFFFFFFFF; // -1
        D1 = 32'hFFFFFFFF; // -1
        #10;
        if (Q !== 32'hFFFFFFFE) begin // -2
            $display("FAIL: Test case 5 failed, expected FFFFFFFE but got %h", Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule