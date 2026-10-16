`timescale 1ns/1ps

module tb_bin2bcd4bit;

reg [3:0] bin;
wire [3:0] msb;
wire [3:0] lsb;

// Instantiate the module under test (uut)
bin2bcd4bit uut (
    .msb(msb),
    .lsb(lsb),
    .bin(bin)
);

initial begin
    // Test cases
    // Test case 0: bin = 0
    bin = 4'b0000; #10;
    if (msb !== 4'b0000 || lsb !== 4'b0000) begin
        $display("FAIL: Test case bin=0 failed");
        $finish;
    end

    // Test case 1: bin = 5
    bin = 4'b0101; #10;
    if (msb !== 4'b0000 || lsb !== 4'b0101) begin
        $display("FAIL: Test case bin=5 failed");
        $finish;
    end

    // Test case 2: bin = 9
    bin = 4'b1001; #10;
    if (msb !== 4'b0000 || lsb !== 4'b1001) begin
        $display("FAIL: Test case bin=9 failed");
        $finish;
    end

    // Test case 3: bin = 10
    bin = 4'b1010; #10;
    if (msb !== 4'b0001 || lsb !== 4'b0000) begin
        $display("FAIL: Test case bin=10 failed");
        $finish;
    end

    // Test case 4: bin = 15
    bin = 4'b1111; #10;
    if (msb !== 4'b0001 || lsb !== 4'b0101) begin
        $display("FAIL: Test case bin=15 failed");
        $finish;
    end

    // Test case 5: bin = 8
    bin = 4'b1000; #10;
    if (msb !== 4'b0000 || lsb !== 4'b1000) begin
        $display("FAIL: Test case bin=8 failed");
        $finish;
    end

    // Test case 6: bin = 3
    bin = 4'b0011; #10;
    if (msb !== 4'b0000 || lsb !== 4'b0011) begin
        $display("FAIL: Test case bin=3 failed");
        $finish;
    end

    // Test case 7: bin = 12
    bin = 4'b1100; #10;
    if (msb !== 4'b0001 || lsb !== 4'b0010) begin
        $display("FAIL: Test case bin=12 failed");
        $finish;
    end

    // Test case 8: bin = 13
    bin = 4'b1101; #10;
    if (msb !== 4'b0001 || lsb !== 4'b0011) begin
        $display("FAIL: Test case bin=13 failed");
        $finish;
    end

    // Test case 9: bin = 14
    bin = 4'b1110; #10;
    if (msb !== 4'b0001 || lsb !== 4'b0100) begin
        $display("FAIL: Test case bin=14 failed");
        $finish;
    end

    // Test case 10: bin = 15
    bin = 4'b1111; #10;
    if (msb !== 4'b0001 || lsb !== 4'b0101) begin
        $display("FAIL: Test case bin=15 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule