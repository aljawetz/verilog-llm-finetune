`timescale 1ns/1ps

module tb_ENCODER_2X1;

    reg [1:0] IN;
    wire OUT;

    // Instantiate the module under test (uut)
    ENCODER_2X1 uut (
        .IN(IN),
        .OUT(OUT)
    );

    initial begin
        // Test case 1: Input 2'b10 should produce OUT = 1
        IN = 2'b10;
        #10;
        if (OUT !== 1'b1) begin
            $display("FAIL: Expected OUT = 1 for IN = 2'b10, got OUT = %b", OUT);
            $finish;
        end

        // Test case 2: Input 2'b01 should produce OUT = 0
        IN = 2'b01;
        #10;
        if (OUT !== 1'b0) begin
            $display("FAIL: Expected OUT = 0 for IN = 2'b01, got OUT = %b", OUT);
            $finish;
        end

        // Test case 3: Input 2'b00 should produce OUT = x
        IN = 2'b00;
        #10;
        if (OUT !== 1'bx) begin
            $display("FAIL: Expected OUT = x for IN = 2'b00, got OUT = %b", OUT);
            $finish;
        end

        // Test case 4: Input 2'b11 should produce OUT = x
        IN = 2'b11;
        #10;
        if (OUT !== 1'bx) begin
            $display("FAIL: Expected OUT = x for IN = 2'b11, got OUT = %b", OUT);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule