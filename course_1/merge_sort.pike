#!/usr/bin/pike

array(int) merge(array(int) a, array(int) b)
{
    int i = 0;
    int j = 0;
    array(int) r = ({ });

    for (int k = 0; k < sizeof(b) + sizeof(b); k ++)
    {
        if (i == sizeof(a))
            return r += b[j..];

        if (j == sizeof(b))
            return r += a[i..];

        if (a[i] <= b[j])
        {
            r += ({ a[i] });
            i++;
        }
        else
        {
            r += ({ b[j] });
            j++;
        }
    }
    return r;
}

array(int) merge_sort(array(int) u)
{
    array(int) a = u[..sizeof(u) / 2 -1];
    array(int) b = u[sizeof(u) / 2..];

    if (sizeof(a) < 2)
        return merge(a, b);

    return merge(merge_sort(a), merge_sort(b));
}

int main()
{
    array(int) unsorted = ({
        4, 9, 1, 11, 91, 1, -1, -30, 0
    });

    werror("%O\n", merge_sort(unsorted));

    return 0;
}
