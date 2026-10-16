`timescale 1ns/1ps

module tb_complement_2s;

reg [3:0] data;
wire signed [3:0] out;

// Instantiate the module under test
complement_2s uut (
    .data(data),
    .out(out)
);

initial begin
    // Test case 1: data = 0000
    data = 4'b0000; 
    #10;
    if (out !== 4'b0000) begin
        $display("FAIL: Expected out = 0000 for data = 0000, got out = %b", out);
        $finish;
    end

    // Test case 2: data = 0001
    data = 4'b0001; 
    #10;
    if (out !== 4'b1111) begin
        $display("FAIL: Expected out = 1111 for data = 0001, got out = %b", out);
        $finish;
    end

    // Test case 3: data = 0010
    data = 4'b0010; 
    #10;
    if (out !== 4'b1110) begin
        $display("FAIL: Expected out = 1110 for data = 0010, got out = %b", out);
        $finish;
    end

    // Test case 4: data = 0100
    data = 4'b0100; 
    #10;
    if (out !== 4'b1100) begin
        $display("FAIL: Expected out = 1100 for data = 0100, got out = %b", out);
        $finish;
    end

    // Test case 5: data = 1000
    data = 4'b1000; 
    #10;
    if (out !== 4'b1000) begin
        $display("FAIL: Expected out = 1000 for data = 1000, got out = %b", out);
        $finish;
    end

    // Test case 6: data = 1111
    data = 4'b1111; 
    #10;
    if (out !== 4'b0001) begin
        $display("FAIL: Expected out = 0001 for data = 1111, got out = %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule