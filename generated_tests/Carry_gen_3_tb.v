`timescale 1ns/1ps

module tb_Carry_gen;

    parameter data_width = 4;

    reg [(data_width-1):0] a;
    reg [(data_width-1):0] b;
    reg cin;
    wire cout;

    // Instantiate the Carry_gen module
    Carry_gen #(.data_width(data_width)) uut (
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; cin = 0;
        #10;
        if (cout !== 0) $display("FAIL: Test case 1 failed, expected cout = 0, got %b", cout);

        // Test case 2: 0 + 0 + 1 = 0
        a = 4'b0000; b = 4'b0000; cin = 1;
        #10;
        if (cout !== 0) $display("FAIL: Test case 2 failed, expected cout = 0, got %b", cout);

        // Test case 3: 0 + 1 + 0 = 0
        a = 4'b0000; b = 4'b0001; cin = 0;
        #10;
        if (cout !== 0) $display("FAIL: Test case 3 failed, expected cout = 0, got %b", cout);

        // Test case 4: 1 + 1 + 0 = 1
        a = 4'b0001; b = 4'b0001; cin = 0;
        #10;
        if (cout !== 1) $display("FAIL: Test case 4 failed, expected cout = 1, got %b", cout);

        // Test case 5: 1 + 1 + 1 = 1
        a = 4'b0001; b = 4'b0001; cin = 1;
        #10;
        if (cout !== 1) $display("FAIL: Test case 5 failed, expected cout = 1, got %b", cout);

        // Test case 6: 1 + 0 + 1 = 1
        a = 4'b0001; b = 4'b0000; cin = 1;
        #10;
        if (cout !== 1) $display("FAIL: Test case 6 failed, expected cout = 1, got %b", cout);

        // Test case 7: 1 + 1 + 0 = 1
        a = 4'b1111; b = 4'b1111; cin = 0;
        #10;
        if (cout !== 1) $display("FAIL: Test case 7 failed, expected cout = 1, got %b", cout);

        // Test case 8: 1 + 1 + 1 = 1
        a = 4'b1111; b = 4'b1111; cin = 1;
        #10;
        if (cout !== 1) $display("FAIL: Test case 8 failed, expected cout = 1, got %b", cout);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule