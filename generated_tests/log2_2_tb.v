`timescale 1ns/1ps

module tb_log2;

    reg [7:0] value;
    wire [2:0] power;

    // Instantiate the module under test (uut)
    log2 uut (
        .value(value),
        .power(power)
    );

    initial begin
        // Test cases
        value = 8'd1; #10;
        if (power !== 3'd0) begin
            $display("FAIL: Expected power for 1 is 0, got %d", power);
            $finish;
        end

        value = 8'd2; #10;
        if (power !== 3'd1) begin
            $display("FAIL: Expected power for 2 is 1, got %d", power);
            $finish;
        end

        value = 8'd4; #10;
        if (power !== 3'd2) begin
            $display("FAIL: Expected power for 4 is 2, got %d", power);
            $finish;
        end

        value = 8'd8; #10;
        if (power !== 3'd3) begin
            $display("FAIL: Expected power for 8 is 3, got %d", power);
            $finish;
        end

        value = 8'd16; #10;
        if (power !== 3'd4) begin
            $display("FAIL: Expected power for 16 is 4, got %d", power);
            $finish;
        end

        value = 8'd32; #10;
        if (power !== 3'd5) begin
            $display("FAIL: Expected power for 32 is 5, got %d", power);
            $finish;
        end

        value = 8'd64; #10;
        if (power !== 3'd6) begin
            $display("FAIL: Expected power for 64 is 6, got %d", power);
            $finish;
        end

        value = 8'd128; #10;
        if (power !== 3'd7) begin
            $display("FAIL: Expected power for 128 is 7, got %d", power);
            $finish;
        end

        value = 8'd3; #10; // Not a power of 2
        if (power !== 3'd0) begin
            $display("FAIL: Expected power for 3 is 0, got %d", power);
            $finish;
        end

        value = 8'd0; #10; // Edge case
        if (power !== 3'd0) begin
            $display("FAIL: Expected power for 0 is 0, got %d", power);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule