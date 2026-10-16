`timescale 1ns/1ps

module tb_prior_encoder_4x2;

reg [3:0] y;
wire [1:0] a;

// Instantiate the module under test
prior_encoder_4x2 uut (
    .y(y),
    .a(a)
);

initial begin
    // Test case 1: y = 4'b1000 (output should be 2'b11)
    y = 4'b1000; #10;
    if (a !== 2'b11) begin
        $display("FAIL: Test case 1 failed, expected 2'b11, got %b", a);
        $finish;
    end

    // Test case 2: y = 4'b0100 (output should be 2'b10)
    y = 4'b0100; #10;
    if (a !== 2'b10) begin
        $display("FAIL: Test case 2 failed, expected 2'b10, got %b", a);
        $finish;
    end

    // Test case 3: y = 4'b0010 (output should be 2'b01)
    y = 4'b0010; #10;
    if (a !== 2'b01) begin
        $display("FAIL: Test case 3 failed, expected 2'b01, got %b", a);
        $finish;
    end

    // Test case 4: y = 4'b0001 (output should be 2'b00)
    y = 4'b0001; #10;
    if (a !== 2'b00) begin
        $display("FAIL: Test case 4 failed, expected 2'b00, got %b", a);
        $finish;
    end

    // Test case 5: y = 4'b0000 (output should be 2'b00)
    y = 4'b0000; #10;
    if (a !== 2'b00) begin
        $display("FAIL: Test case 5 failed, expected 2'b00, got %b", a);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule