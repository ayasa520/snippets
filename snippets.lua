ls.snippets = {
    markdown = {
        -- 可以正则		
        s({trig = "tb(%d+)*(%d+)", regTrig = true,dscr="生成表格"},{
   
            -- pos, function, argnodes, user_arg1
            d(1, function(args, snip, old_state, initial_text)
                local nodes = {}
                -- count is nil for invalid input.
                local row = snip.captures[1]
                local col = snip.captures[2]
                -- Make sure there's a number in args[1] and arg[2].
                    for j=1, row+1 do
                        for k=1,col do  
                            local iNode
                            if j==2 then
                                iNode = i((j-1)*col+k,":-:")
                                nodes[(col*2+1)*(j-1)+2*k]=iNode
                                nodes[(col*2+1)*(j-1)+2*k-1] = t("|")
                            else
                                iNode = i((j-1)*col+k,initial_text)
                                nodes[(col*2+1)*(j-1)+2*k]=iNode
                                nodes[(col*2+1)*(j-1)+2*k-1] = t("|")
                            end
                        end
                        -- linebreak
                        nodes[(col*2+1)*(j-1)+2*col+1] = t({"|",""}) 
                    end
                local snip = sn(nil, nodes)
                -- snip.old_state = old_state
                return snip
            end, {}, "   ")
        })
    }
}