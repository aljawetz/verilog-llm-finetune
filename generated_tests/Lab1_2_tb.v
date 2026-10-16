`timescale 1ns/1ps

module tb_Lab1;

reg [17:0] SW;
wire [17:0] LEDR;

// Instantiate the module under test (uut)
Lab1 uut (
    .SW(SW),
    .LEDR(LEDR)
);

initial begin
    // Test sequence
    // Test case 1: All switches off
    SW = 18'b000000000000000000;
    #10;
    if (LEDR !== 18'b000000000000000000) begin
        $display("FAIL: Test case 1 failed, expected 0x00000 but got %b", LEDR);
        $finish;
    end

    // Test case 2: All switches on
    SW = 18'b111111111111111111;
    #10;
    if (LEDR !== 18'b111111111111111111) begin
        $display("FAIL: Test case 2 failed, expected 0xFFFFF but got %b", LEDR);
        $finish;
    end

    // Test case 3: Alternating bits
    SW = 18'b101010101010101010;
    #10;
    if (LEDR !== 18'b101010101010101010) begin
        $display("FAIL: Test case 3 failed, expected 0xAAAAA but got %b", LEDR);
        $finish;
    end

    // Test case 4: Incrementing values
    SW = 18'b000000000000000001;
    #10;
    if (LEDR !== 18'b000000000000000001) begin
        $display("FAIL: Test case 4 failed, expected 0x00001 but got %b", LEDR);
        $finish;
    end

    SW = 18'b000000000000000010;
    #10;
    if (LEDR !== 18'b000000000000000010) begin
        $display("FAIL: Test case 4 failed, expected 0x00002 but got %b", LEDR);
        $finish;
    end

    // Test case 5: Random value
    SW = 18'b110011001100110011;
    #10;
    if (LEDR !== 18'b110011001100110011) begin
        $display("FAIL: Test case 5 failed, expected 0xCCCC but got %b", LEDR);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule