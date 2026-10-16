`timescale 1ns/1ps

module tb_binary_to_gray;

reg [3:0] b;
wire [3:0] g;

// Instantiate the module under test (uut)
binary_to_gray uut (
    .b(b),
    .g(g)
);

initial begin
    // Test vector 0: binary 0000 -> gray 0000
    b = 4'b0000; #10;
    if (g !== 4'b0000) begin
        $display("FAIL: Test vector 0 failed. Expected 0000, got %b", g);
        $finish;
    end

    // Test vector 1: binary 0001 -> gray 0001
    b = 4'b0001; #10;
    if (g !== 4'b0001) begin
        $display("FAIL: Test vector 1 failed. Expected 0001, got %b", g);
        $finish;
    end

    // Test vector 2: binary 0010 -> gray 0011
    b = 4'b0010; #10;
    if (g !== 4'b0011) begin
        $display("FAIL: Test vector 2 failed. Expected 0011, got %b", g);
        $finish;
    end

    // Test vector 3: binary 0011 -> gray 0010
    b = 4'b0011; #10;
    if (g !== 4'b0010) begin
        $display("FAIL: Test vector 3 failed. Expected 0010, got %b", g);
        $finish;
    end

    // Test vector 4: binary 0100 -> gray 0110
    b = 4'b0100; #10;
    if (g !== 4'b0110) begin
        $display("FAIL: Test vector 4 failed. Expected 0110, got %b", g);
        $finish;
    end

    // Test vector 5: binary 0101 -> gray 0111
    b = 4'b0101; #10;
    if (g !== 4'b0111) begin
        $display("FAIL: Test vector 5 failed. Expected 0111, got %b", g);
        $finish;
    end

    // Test vector 6: binary 0110 -> gray 0101
    b = 4'b0110; #10;
    if (g !== 4'b0101) begin
        $display("FAIL: Test vector 6 failed. Expected 0101, got %b", g);
        $finish;
    end

    // Test vector 7: binary 0111 -> gray 0100
    b = 4'b0111; #10;
    if (g !== 4'b0100) begin
        $display("FAIL: Test vector 7 failed. Expected 0100, got %b", g);
        $finish;
    end

    // Test vector 8: binary 1000 -> gray 1100
    b = 4'b1000; #10;
    if (g !== 4'b1100) begin
        $display("FAIL: Test vector 8 failed. Expected 1100, got %b", g);
        $finish;
    end

    // Test vector 9: binary 1001 -> gray 1101
    b = 4'b1001; #10;
    if (g !== 4'b1101) begin
        $display("FAIL: Test vector 9 failed. Expected 1101, got %b", g);
        $finish;
    end

    // Test vector 10: binary 1010 -> gray 1111
    b = 4'b1010; #10;
    if (g !== 4'b1111) begin
        $display("FAIL: Test vector 10 failed. Expected 1111, got %b", g);
        $finish;
    end

    // Test vector 11: binary 1011 -> gray 1110
    b = 4'b1011; #10;
    if (g !== 4'b1110) begin
        $display("FAIL: Test vector 11 failed. Expected 1110, got %b", g);
        $finish;
    end

    // Test vector 12: binary 1100 -> gray 1010
    b = 4'b1100; #10;
    if (g !== 4'b1010) begin
        $display("FAIL: Test vector 12 failed. Expected 1010, got %b", g);
        $finish;
    end

    // Test vector 13: binary 1101 -> gray 1011
    b = 4'b1101; #10;
    if (g !== 4'b1011) begin
        $display("FAIL: Test vector 13 failed. Expected 1011, got %b", g);
        $finish;
    end

    // Test vector 14: binary 1110 -> gray 1001
    b = 4'b1110; #10;
    if (g !== 4'b1001) begin
        $display("FAIL: Test vector 14 failed. Expected 1001, got %b", g);
        $finish;
    end

    // Test vector 15: binary 1111 -> gray 1000
    b = 4'b1111; #10;
    if (g !== 4'b1000) begin
        $display("FAIL: Test vector 15 failed. Expected 1000, got %b", g);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule