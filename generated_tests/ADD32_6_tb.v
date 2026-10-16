`timescale 1ns/1ps

module tb_ADD32;

    reg [31:0] D0;
    reg [31:0] D1;
    wire [31:0] Q;

    // Instantiate the module under test (uut)
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

        // Test case 2: Adding two maximum values
        D0 = 32'hFFFFFFFF; // -1
        D1 = 32'h00000001; // 1
        #10;
        if (Q !== 32'h00000000) begin
            $display("FAIL: Test case 2 failed, expected 0 but got %h", Q);
            $finish;
        end

        // Test case 3: Adding zero
        D0 = 32'h00000000; // 0
        D1 = 32'h00000000; // 0
        #10;
        if (Q !== 32'h00000000) begin
            $display("FAIL: Test case 3 failed, expected 0 but got %h", Q);
            $finish;
        end

        // Test case 4: Adding a positive and a negative number
        D0 = 32'h0000000A; // 10
        D1 = 32'hFFFFFFF6; // -10
        #10;
        if (Q !== 32'h00000000) begin
            $display("FAIL: Test case 4 failed, expected 0 but got %h", Q);
            $finish;
        end

        // Test case 5: Large numbers
        D0 = 32'h7FFFFFFF; // 2147483647
        D1 = 32'h00000001; // 1
        #10;
        if (Q !== 32'h80000000) begin
            $display("FAIL: Test case 5 failed, expected 80000000 but got %h", Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule