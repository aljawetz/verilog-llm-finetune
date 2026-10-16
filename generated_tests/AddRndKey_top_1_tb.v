`timescale 1ns/1ps

module tb_AddRndKey_top;

    // Parameters
    reg [127:0] ip;
    reg [127:0] ip_key;
    reg enable;
    wire [127:0] op;

    // Instantiate the module under test (uut)
    AddRndKey_top uut (
        .ip(ip),
        .ip_key(ip_key),
        .enable(enable),
        .op(op)
    );

    // Test procedure
    initial begin
        // Test case 1: enable = 0, output should be equal to input
        ip = 128'h0123456789abcdef0123456789abcdef;
        ip_key = 128'hfedcba9876543210fedcba9876543210;
        enable = 0;
        #10;
        if (op !== ip) begin
            $display("FAIL: Test case 1 failed, expected op = %h, got op = %h", ip, op);
            $finish;
        end

        // Test case 2: enable = 1, output should be ip XOR ip_key
        enable = 1;
        #10;
        if (op !== (ip ^ ip_key)) begin
            $display("FAIL: Test case 2 failed, expected op = %h, got op = %h", (ip ^ ip_key), op);
            $finish;
        end

        // Test case 3: Different inputs
        ip = 128'h00000000000000000000000000000000;
        ip_key = 128'hffffffffffffffffffffffffffffffff;
        enable = 1;
        #10;
        if (op !== (ip ^ ip_key)) begin
            $display("FAIL: Test case 3 failed, expected op = %h, got op = %h", (ip ^ ip_key), op);
            $finish;
        end

        // Test case 4: Check with random values
        ip = 128'h1234567890abcdef1234567890abcdef;
        ip_key = 128'habcdef0123456789abcdef0123456789;
        enable = 1;
        #10;
        if (op !== (ip ^ ip_key)) begin
            $display("FAIL: Test case 4 failed, expected op = %h, got op = %h", (ip ^ ip_key), op);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule