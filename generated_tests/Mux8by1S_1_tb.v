`timescale 1ns/1ps

module tb_Mux8by1S;

reg [7:0] i;
reg [2:0] s;
wire y;

// Instantiate the module under test (uut)
Mux8by1S uut (
    .i(i),
    .s(s),
    .y(y)
);

initial begin
    // Test case 1: Select input 0
    i = 8'b10101010; // Input values
    s = 3'b000;     // Select line for input 0
    #10;
    if (y !== i[0]) begin
        $display("FAIL: Test case 1 failed, expected %b, got %b", i[0], y);
        $finish;
    end

    // Test case 2: Select input 1
    s = 3'b001;     // Select line for input 1
    #10;
    if (y !== i[1]) begin
        $display("FAIL: Test case 2 failed, expected %b, got %b", i[1], y);
        $finish;
    end

    // Test case 3: Select input 2
    s = 3'b010;     // Select line for input 2
    #10;
    if (y !== i[2]) begin
        $display("FAIL: Test case 3 failed, expected %b, got %b", i[2], y);
        $finish;
    end

    // Test case 4: Select input 3
    s = 3'b011;     // Select line for input 3
    #10;
    if (y !== i[3]) begin
        $display("FAIL: Test case 4 failed, expected %b, got %b", i[3], y);
        $finish;
    end

    // Test case 5: Select input 4
    s = 3'b100;     // Select line for input 4
    #10;
    if (y !== i[4]) begin
        $display("FAIL: Test case 5 failed, expected %b, got %b", i[4], y);
        $finish;
    end

    // Test case 6: Select input 5
    s = 3'b101;     // Select line for input 5
    #10;
    if (y !== i[5]) begin
        $display("FAIL: Test case 6 failed, expected %b, got %b", i[5], y);
        $finish;
    end

    // Test case 7: Select input 6
    s = 3'b110;     // Select line for input 6
    #10;
    if (y !== i[6]) begin
        $display("FAIL: Test case 7 failed, expected %b, got %b", i[6], y);
        $finish;
    end

    // Test case 8: Select input 7
    s = 3'b111;     // Select line for input 7
    #10;
    if (y !== i[7]) begin
        $display("FAIL: Test case 8 failed, expected %b, got %b", i[7], y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule