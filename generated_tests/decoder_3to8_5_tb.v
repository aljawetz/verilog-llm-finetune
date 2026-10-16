`timescale 1ns/1ps

module tb_decoder_3to8;

    reg c, b, a;
    wire y0, y1, y2, y3, y4, y5, y6, y7;

    // Instantiate the module under test (uut)
    decoder_3to8 uut (
        .c(c),
        .b(b),
        .a(a),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4),
        .y5(y5),
        .y6(y6),
        .y7(y7)
    );

    initial begin
        // Test all combinations of inputs
        {c, b, a} = 3'b000; #10;
        if (y0 !== 1 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
            $display("FAIL: Test case 000 failed");

        {c, b, a} = 3'b001; #10;
        if (y0 !== 0 || y1 !== 1 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
            $display("FAIL: Test case 001 failed");

        {c, b, a} = 3'b010; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 1 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
            $display("FAIL: Test case 010 failed");

        {c, b, a} = 3'b011; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 1 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
            $display("FAIL: Test case 011 failed");

        {c, b, a} = 3'b100; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 1 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
            $display("FAIL: Test case 100 failed");

        {c, b, a} = 3'b101; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 1 || y6 !== 0 || y7 !== 0) 
            $display("FAIL: Test case 101 failed");

        {c, b, a} = 3'b110; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 1 || y7 !== 0) 
            $display("FAIL: Test case 110 failed");

        {c, b, a} = 3'b111; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 1) 
            $display("FAIL: Test case 111 failed");

        $display("PASS");
        $finish;
    end

endmodule