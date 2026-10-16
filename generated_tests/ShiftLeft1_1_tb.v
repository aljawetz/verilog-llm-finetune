`timescale 1ns/1ps

module tb_ShiftLeft1;

    reg [31:0] d_in;
    wire [31:0] d_out;

    // Instantiate the module under test (uut)
    ShiftLeft1 uut (
        .d_in(d_in),
        .d_out(d_out)
    );

    initial begin
        // Test case 1: Shift left 1 on 0
        d_in = 32'b0;
        #10;
        if (d_out !== 32'b0) begin
            $display("FAIL: Test case 1 failed, expected 0, got %b", d_out);
            $finish;
        end

        // Test case 2: Shift left 1 on 1
        d_in = 32'b1;
        #10;
        if (d_out !== 32'b10) begin
            $display("FAIL: Test case 2 failed, expected 10, got %b", d_out);
            $finish;
        end

        // Test case 3: Shift left 1 on all bits set
        d_in = 32'b11111111111111111111111111111111;
        #10;
        if (d_out !== 32'b111111111111111111111111111111110) begin
            $display("FAIL: Test case 3 failed, expected 111111111111111111111111111111110, got %b", d_out);
            $finish;
        end

        // Test case 4: Shift left 1 on alternating bits
        d_in = 32'b10101010101010101010101010101010;
        #10;
        if (d_out !== 32'b101010101010101010101010101010100) begin
            $display("FAIL: Test case 4 failed, expected 101010101010101010101010101010100, got %b", d_out);
            $finish;
        end

        // Test case 5: Shift left 1 on maximum value
        d_in = 32'hFFFFFFFF;
        #10;
        if (d_out !== 32'hFFFFFFFE) begin
            $display("FAIL: Test case 5 failed, expected FFFFFFFE, got %h", d_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule