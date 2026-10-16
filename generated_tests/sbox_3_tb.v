`timescale 1ns/1ps

module tb_sbox;

    reg [5:0] ip_6;
    wire [3:0] op_4;

    // Instantiate the module under test
    sbox uut (
        .ip_6(ip_6),
        .op_4(op_4)
    );

    initial begin
        // Test cases
        // Test case 1
        ip_6 = 6'b000000; #10;
        if (op_4 !== 4'd14) begin
            $display("FAIL: Expected 14 for input 000000, got %d", op_4);
            $finish;
        end

        // Test case 2
        ip_6 = 6'b000001; #10;
        if (op_4 !== 4'd4) begin
            $display("FAIL: Expected 4 for input 000001, got %d", op_4);
            $finish;
        end

        // Test case 3
        ip_6 = 6'b000010; #10;
        if (op_4 !== 4'd13) begin
            $display("FAIL: Expected 13 for input 000010, got %d", op_4);
            $finish;
        end

        // Test case 4
        ip_6 = 6'b000011; #10;
        if (op_4 !== 4'd1) begin
            $display("FAIL: Expected 1 for input 000011, got %d", op_4);
            $finish;
        end

        // Test case 5
        ip_6 = 6'b111111; #10;
        if (op_4 !== 4'd13) begin
            $display("FAIL: Expected 13 for input 111111, got %d", op_4);
            $finish;
        end

        // Test case 6
        ip_6 = 6'b111110; #10;
        if (op_4 !== 4'd6) begin
            $display("FAIL: Expected 6 for input 111110, got %d", op_4);
            $finish;
        end

        // Test case 7
        ip_6 = 6'b010101; #10;
        if (op_4 !== 4'd2) begin
            $display("FAIL: Expected 2 for input 010101, got %d", op_4);
            $finish;
        end

        // Test case 8
        ip_6 = 6'b101010; #10;
        if (op_4 !== 4'd9) begin
            $display("FAIL: Expected 9 for input 101010, got %d", op_4);
            $finish;
        end

        // Test case 9
        ip_6 = 6'b011011; #10;
        if (op_4 !== 4'd11) begin
            $display("FAIL: Expected 11 for input 011011, got %d", op_4);
            $finish;
        end

        // Test case 10
        ip_6 = 6'b100100; #10;
        if (op_4 !== 4'd13) begin
            $display("FAIL: Expected 13 for input 100100, got %d", op_4);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule