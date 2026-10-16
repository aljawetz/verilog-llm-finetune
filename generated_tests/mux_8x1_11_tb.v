`timescale 1ns/1ps

module tb_mux_8x1;

    reg [7:0] I;
    reg [2:0] sel;
    wire Y;

    // Instantiate the module under test
    mux_8x1 uut (
        .I(I),
        .sel(sel),
        .Y(Y)
    );

    initial begin
        // Test case 1: Select 0
        I = 8'b10101010; sel = 3'b000; #10;
        if (Y !== I[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", I[0], Y);

        // Test case 2: Select 1
        I = 8'b10101010; sel = 3'b001; #10;
        if (Y !== I[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", I[1], Y);

        // Test case 3: Select 2
        I = 8'b10101010; sel = 3'b010; #10;
        if (Y !== I[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", I[2], Y);

        // Test case 4: Select 3
        I = 8'b10101010; sel = 3'b011; #10;
        if (Y !== I[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", I[3], Y);

        // Test case 5: Select 4
        I = 8'b10101010; sel = 3'b100; #10;
        if (Y !== I[4]) $display("FAIL: Test case 5 failed, expected %b, got %b", I[4], Y);

        // Test case 6: Select 5
        I = 8'b10101010; sel = 3'b101; #10;
        if (Y !== I[5]) $display("FAIL: Test case 6 failed, expected %b, got %b", I[5], Y);

        // Test case 7: Select 6
        I = 8'b10101010; sel = 3'b110; #10;
        if (Y !== I[6]) $display("FAIL: Test case 7 failed, expected %b, got %b", I[6], Y);

        // Test case 8: Select 7
        I = 8'b10101010; sel = 3'b111; #10;
        if (Y !== I[7]) $display("FAIL: Test case 8 failed, expected %b, got %b", I[7], Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule