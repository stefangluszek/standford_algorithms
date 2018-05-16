#!/usr/bin/pike

int split_inversions(array(int) left, array(int) right)
{
    int inv = 0;
    int i = 0;
    int j = 0;
    sort(left);
    sort(right);

    for (int m = 0; m < sizeof(left) + sizeof(right); m++)
    {
        if (j >= sizeof(right))
            return inv;

        if (i < sizeof(left) && left[i] <= right[j])
        {
            i++;
        }
        else
        {
            inv += sizeof(left) - i;
            j++;
        }
    }

    return inv;
}

int inversions(array(int) d)
{
    if (sizeof(d) == 1)
        return 0;

   int m = sizeof(d) / 2;
   array(int) left = d[..m - 1];
   array(int) right = d[m..];

   return inversions(left) + inversions(right) + split_inversions(left, right);
}

int main()
{
    array(int) data = (array(int))(Stdio.read_file("IntegerArray.txt") / "\n");
    data = data[..<1];
    werror("%d\n", inversions(data));
    return 0;
}
