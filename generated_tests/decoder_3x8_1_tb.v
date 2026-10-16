`timescale 1ns/1ps

module tb_decoder_3x8;

reg [2:0] in;
reg En;
wire [7:0] D;

// Instantiate the module under test
decoder_3x8 uut (
    .in(in),
    .En(En),
    .D(D)
);

initial begin
    // Test case 1: Enable is low, all outputs should be zero
    En = 0; in = 3'b000; #10;
    if (D !== 8'b0000_0000) begin
        $display("FAIL: Test case 1 failed, expected D=0000_0000, got D=%b", D);
        $finish;
    end

    // Test case 2: Enable is high, input is 000, output should be 0000_0001
    En = 1; in = 3'b000; #10;
    if (D !== 8'b0000_0001) begin
        $display("FAIL: Test case 2 failed, expected D=0000_0001, got D=%b", D);
        $finish;
    end

    // Test case 3: Enable is high, input is 001, output should be 0000_0010
    in = 3'b001; #10;
    if (D !== 8'b0000_0010) begin
        $display("FAIL: Test case 3 failed, expected D=0000_0010, got D=%b", D);
        $finish;
    end

    // Test case 4: Enable is high, input is 010, output should be 0000_0100
    in = 3'b010; #10;
    if (D !== 8'b0000_0100) begin
        $display("FAIL: Test case 4 failed, expected D=0000_0100, got D=%b", D);
        $finish;
    end

    // Test case 5: Enable is high, input is 011, output should be 0000_1000
    in = 3'b011; #10;
    if (D !== 8'b0000_1000) begin
        $display("FAIL: Test case 5 failed, expected D=0000_1000, got D=%b", D);
        $finish;
    end

    // Test case 6: Enable is high, input is 100, output should be 0001_0000
    in = 3'b100; #10;
    if (D !== 8'b0001_0000) begin
        $display("FAIL: Test case 6 failed, expected D=0001_0000, got D=%b", D);
        $finish;
    end

    // Test case 7: Enable is high, input is 101, output should be 0010_0000
    in = 3'b101; #10;
    if (D !== 8'b0010_0000) begin
        $display("FAIL: Test case 7 failed, expected D=0010_0000, got D=%b", D);
        $finish;
    end

    // Test case 8: Enable is high, input is 110, output should be 0100_0000
    in = 3'b110; #10;
    if (D !== 8'b0100_0000) begin
        $display("FAIL: Test case 8 failed, expected D=0100_0000, got D=%b", D);
        $finish;
    end

    // Test case 9: Enable is high, input is 111, output should be 1000_0000
    in = 3'b111; #10;
    if (D !== 8'b1000_0000) begin
        $display("FAIL: Test case 9 failed, expected D=1000_0000, got D=%b", D);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule