`timescale 1ns/1ps

module tb_ENCODER_2X1;

reg [1:0] IN;
wire OUT;

// Instantiate the module under test
ENCODER_2X1 uut (
    .IN(IN),
    .OUT(OUT)
);

initial begin
    // Test case 1: Input = 2'b10, Expected Output = 1
    IN = 2'b10;
    #10;
    if (OUT !== 1'b1) begin
        $display("FAIL: Test case 1 failed. Expected OUT = 1, got OUT = %b", OUT);
        $finish;
    end

    // Test case 2: Input = 2'b01, Expected Output = 0
    IN = 2'b01;
    #10;
    if (OUT !== 1'b0) begin
        $display("FAIL: Test case 2 failed. Expected OUT = 0, got OUT = %b", OUT);
        $finish;
    end

    // Test case 3: Input = 2'b00, Expected Output = x
    IN = 2'b00;
    #10;
    if (OUT !== 1'bx) begin
        $display("FAIL: Test case 3 failed. Expected OUT = x, got OUT = %b", OUT);
        $finish;
    end

    // Test case 4: Input = 2'b11, Expected Output = x
    IN = 2'b11;
    #10;
    if (OUT !== 1'bx) begin
        $display("FAIL: Test case 4 failed. Expected OUT = x, got OUT = %b", OUT);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule