`timescale 1ns/1ps

module tb_encoder_8to3;

    reg en;
    reg [7:0] d_in;
    wire [2:0] y_out;

    // Instantiate the module under test (uut)
    encoder_8to3 uut (
        .en(en),
        .d_in(d_in),
        .y_out(y_out)
    );

    initial begin
        // Initialize signals
        en = 0;
        d_in = 8'b00000000;

        // Test case 1: Check output when enabled and input is 00000001
        en = 1;
        d_in = 8'b00000001;
        #10;
        if (y_out !== 3'b000) begin
            $display("FAIL: Test case 1 failed, expected 000, got %b", y_out);
            $finish;
        end

        // Test case 2: Check output when enabled and input is 00000010
        d_in = 8'b00000010;
        #10;
        if (y_out !== 3'b001) begin
            $display("FAIL: Test case 2 failed, expected 001, got %b", y_out);
            $finish;
        end

        // Test case 3: Check output when enabled and input is 00000100
        d_in = 8'b00000100;
        #10;
        if (y_out !== 3'b010) begin
            $display("FAIL: Test case 3 failed, expected 010, got %b", y_out);
            $finish;
        end

        // Test case 4: Check output when enabled and input is 00001000
        d_in = 8'b00001000;
        #10;
        if (y_out !== 3'b011) begin
            $display("FAIL: Test case 4 failed, expected 011, got %b", y_out);
            $finish;
        end

        // Test case 5: Check output when enabled and input is 00010000
        d_in = 8'b00010000;
        #10;
        if (y_out !== 3'b100) begin
            $display("FAIL: Test case 5 failed, expected 100, got %b", y_out);
            $finish;
        end

        // Test case 6: Check output when enabled and input is 00100000
        d_in = 8'b00100000;
        #10;
        if (y_out !== 3'b101) begin
            $display("FAIL: Test case 6 failed, expected 101, got %b", y_out);
            $finish;
        end

        // Test case 7: Check output when enabled and input is 01000000
        d_in = 8'b01000000;
        #10;
        if (y_out !== 3'b110) begin
            $display("FAIL: Test case 7 failed, expected 110, got %b", y_out);
            $finish;
        end

        // Test case 8: Check output when enabled and input is 10000000
        d_in = 8'b10000000;
        #10;
        if (y_out !== 3'b111) begin
            $display("FAIL: Test case 8 failed, expected 111, got %b", y_out);
            $finish;
        end

        // Test case 9: Check output when disabled
        en = 0;
        d_in = 8'b00000001; // Input should not matter when disabled
        #10;
        if (y_out !== 3'b000) begin
            $display("FAIL: Test case 9 failed, expected 000, got %b", y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule