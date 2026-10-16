`timescale 1ns/1ps

module tb_mux8_1;

reg [2:0] s;
reg [7:0] in;
wire out;

// Instantiate the module under test
mux8_1 uut (
    .s(s),
    .in(in),
    .out(out)
);

initial begin
    // Test case 1: Select 0, expect output to be in[0]
    in = 8'b10101010; // Input values
    s = 3'b000; // Select line
    #10; // Wait for output
    if (out !== in[0]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[0], out);
        $finish;
    end

    // Test case 2: Select 1, expect output to be in[1]
    s = 3'b001; // Select line
    #10; // Wait for output
    if (out !== in[1]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[1], out);
        $finish;
    end

    // Test case 3: Select 2, expect output to be in[2]
    s = 3'b010; // Select line
    #10; // Wait for output
    if (out !== in[2]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[2], out);
        $finish;
    end

    // Test case 4: Select 3, expect output to be in[3]
    s = 3'b011; // Select line
    #10; // Wait for output
    if (out !== in[3]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[3], out);
        $finish;
    end

    // Test case 5: Select 4, expect output to be in[4]
    s = 3'b100; // Select line
    #10; // Wait for output
    if (out !== in[4]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[4], out);
        $finish;
    end

    // Test case 6: Select 5, expect output to be in[5]
    s = 3'b101; // Select line
    #10; // Wait for output
    if (out !== in[5]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[5], out);
        $finish;
    end

    // Test case 7: Select 6, expect output to be in[6]
    s = 3'b110; // Select line
    #10; // Wait for output
    if (out !== in[6]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[6], out);
        $finish;
    end

    // Test case 8: Select 7, expect output to be in[7]
    s = 3'b111; // Select line
    #10; // Wait for output
    if (out !== in[7]) begin
        $display("FAIL: Expected out = %b, got out = %b", in[7], out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule