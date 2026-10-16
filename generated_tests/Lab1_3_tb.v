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
    // Test case 1: All switches off
    SW = 18'b000000000000000000;
    #10;
    if (LEDR !== 18'b000000000000000000) begin
        $display("FAIL: Test case 1 failed, expected LEDR = 000000000000000000, got LEDR = %b", LEDR);
        $finish;
    end

    // Test case 2: All switches on
    SW = 18'b111111111111111111;
    #10;
    if (LEDR !== 18'b111111111111111111) begin
        $display("FAIL: Test case 2 failed, expected LEDR = 111111111111111111, got LEDR = %b", LEDR);
        $finish;
    end

    // Test case 3: Alternating switches
    SW = 18'b101010101010101010;
    #10;
    if (LEDR !== 18'b101010101010101010) begin
        $display("FAIL: Test case 3 failed, expected LEDR = 101010101010101010, got LEDR = %b", LEDR);
        $finish;
    end

    // Test case 4: Random pattern
    SW = 18'b110011001100110011;
    #10;
    if (LEDR !== 18'b110011001100110011) begin
        $display("FAIL: Test case 4 failed, expected LEDR = 110011001100110011, got LEDR = %b", LEDR);
        $finish;
    end

    // Test case 5: All switches off again
    SW = 18'b000000000000000000;
    #10;
    if (LEDR !== 18'b000000000000000000) begin
        $display("FAIL: Test case 5 failed, expected LEDR = 000000000000000000, got LEDR = %b", LEDR);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule