`timescale 1ns/1ps

module tb_bit1_shift;

    reg [15:0] Ain;
    wire [15:0] Aout;

    // Instantiate the module under test
    bit1_shift uut (
        .Ain(Ain),
        .Aout(Aout)
    );

    initial begin
        // Test case 1: Shift 0000_0000_0000_0001
        Ain = 16'b0000_0000_0000_0001;
        #10;
        if (Aout !== 16'b0000_0000_0000_0000) begin
            $display("FAIL: Test case 1 failed. Expected 0000_0000_0000_0000, got %b", Aout);
            $finish;
        end

        // Test case 2: Shift 1111_1111_1111_1111
        Ain = 16'b1111_1111_1111_1111;
        #10;
        if (Aout !== 16'b0111_1111_1111_1111) begin
            $display("FAIL: Test case 2 failed. Expected 0111_1111_1111_1111, got %b", Aout);
            $finish;
        end

        // Test case 3: Shift 0000_0000_0000_0000
        Ain = 16'b0000_0000_0000_0000;
        #10;
        if (Aout !== 16'b0000_0000_0000_0000) begin
            $display("FAIL: Test case 3 failed. Expected 0000_0000_0000_0000, got %b", Aout);
            $finish;
        end

        // Test case 4: Shift 1010_1010_1010_1010
        Ain = 16'b1010_1010_1010_1010;
        #10;
        if (Aout !== 16'b0101_0101_0101_0101) begin
            $display("FAIL: Test case 4 failed. Expected 0101_0101_0101_0101, got %b", Aout);
            $finish;
        end

        // Test case 5: Shift 0000_0000_1111_1111
        Ain = 16'b0000_0000_1111_1111;
        #10;
        if (Aout !== 16'b0000_0000_0111_1111) begin
            $display("FAIL: Test case 5 failed. Expected 0000_0000_0111_1111, got %b", Aout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule