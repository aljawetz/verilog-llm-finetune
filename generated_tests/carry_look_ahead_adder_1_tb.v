`timescale 1ns/1ps

module tb_carry_look_ahead_adder;

    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] sum;
    wire overflow;

    carry_look_ahead_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .overflow(overflow)
    );

    initial begin
        // Test case 1: Simple addition without overflow
        a = 32'h00000001; // 1
        b = 32'h00000001; // 1
        #10;
        if (sum !== 32'h00000002 || overflow !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Addition with overflow
        a = 32'h7FFFFFFF; // Max positive value
        b = 32'h00000001; // 1
        #10;
        if (sum !== 32'h80000000 || overflow !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Addition resulting in zero
        a = 32'hFFFFFFFF; // -1
        b = 32'h00000001; // 1
        #10;
        if (sum !== 32'h00000000 || overflow !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Large numbers without overflow
        a = 32'h40000000; // 2.0 in IEEE 754
        b = 32'h40000000; // 2.0 in IEEE 754
        #10;
        if (sum !== 32'h80000000 || overflow !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Random values
        a = 32'h12345678;
        b = 32'h87654321;
        #10;
        if (sum !== 32'h99999999 || overflow !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Both inputs are zero
        a = 32'h00000000;
        b = 32'h00000000;
        #10;
        if (sum !== 32'h00000000 || overflow !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule