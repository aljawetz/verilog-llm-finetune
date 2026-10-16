`timescale 1ns/1ps

module tb_fpadd_altpriority_encoder_3v7;

    reg [1:0] data;
    wire q;

    // Instantiate the module under test (uut)
    fpadd_altpriority_encoder_3v7 uut (
        .data(data),
        .q(q)
    );

    initial begin
        // Test case 1: data = 00
        data = 2'b00;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 2: data = 01
        data = 2'b01;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 3: data = 10
        data = 2'b10;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 4: data = 11
        data = 2'b11;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule