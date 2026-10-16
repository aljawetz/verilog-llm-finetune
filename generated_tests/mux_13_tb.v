`timescale 1ns/1ps

module tb_mux;

reg [12:0] alpha;
reg r;
wire [12:0] out;

// Instantiate the module under test (uut)
mux uut (
    .alpha(alpha),
    .r(r),
    .out(out)
);

initial begin
    // Test case 1: r = 0, expect out = 0
    alpha = 12'b101010101010; // arbitrary value
    r = 0;
    #10;
    if (out !== 12'b000000000000) begin
        $display("FAIL: Test case 1 failed, expected 0, got %b", out);
        $finish;
    end

    // Test case 2: r = 1, expect out = alpha
    r = 1;
    #10;
    if (out !== alpha) begin
        $display("FAIL: Test case 2 failed, expected %b, got %b", alpha, out);
        $finish;
    end

    // Test case 3: r = 0, check with different alpha
    alpha = 12'b111111111111; // all bits set
    r = 0;
    #10;
    if (out !== 12'b000000000000) begin
        $display("FAIL: Test case 3 failed, expected 0, got %b", out);
        $finish;
    end

    // Test case 4: r = 1, check with different alpha
    r = 1;
    #10;
    if (out !== alpha) begin
        $display("FAIL: Test case 4 failed, expected %b, got %b", alpha, out);
        $finish;
    end

    // Test case 5: r = 0, check with another alpha
    alpha = 12'b000011110000; // some bits set
    r = 0;
    #10;
    if (out !== 12'b000000000000) begin
        $display("FAIL: Test case 5 failed, expected 0, got %b", out);
        $finish;
    end

    // Test case 6: r = 1, check with another alpha
    r = 1;
    #10;
    if (out !== alpha) begin
        $display("FAIL: Test case 6 failed, expected %b, got %b", alpha, out);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule